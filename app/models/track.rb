# frozen_string_literal: true

class Track < ApplicationRecord
  validates :title, presence: true
  validates :audio, attached: true, presence: true

  after_commit :reindex

  scope :by_recency, -> { order('recorded_on desc, updated_at desc') }
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: [nil, false]) }

  has_many :track_searches, dependent: :destroy
  has_one_attached :audio

  def pretty_title
    display_title.presence || title
  end

  def signed_url
    audio.url
  end

  # search releated
  def reindex
    self.class.connection.execute self.class.sanitize_sql_for_conditions([
      'delete from track_searches where track_id = ?', id
    ])

    self.class.connection.execute(
      "insert into track_searches(#{self.class.send(:search_fields).join(',')})" \
      "values #{to_search_values}",
    )
  rescue ActiveRecord::StatementInvalid => e
    Rails.logger.error "FAILED TO REINDEX #{e}"
  end

  def self.reindex_all
    connection.execute 'delete from track_searches'
    return unless all.published.count.positive?

    search_values = all.published.map { |t| t.send(:to_search_values) }

    connection.execute(
      "insert into track_searches(#{search_fields.join(',')}) " \
      "values #{search_values.join(', ')}",
    )
  end

  SEARCH_FIELDS_LUT = {
    id: :track_id,
    title: :title,
    description: :description,
  }.freeze

  private_class_method def self.track_fields
    @track_fields ||= SEARCH_FIELDS_LUT.keys
  end

  private_class_method def self.search_fields
    @search_fields ||= SEARCH_FIELDS_LUT.values
  end

  private

  def map_search_values
    self.class.send(:track_fields).map do |field|
      send(field)
    end
  end

  def to_search_values
    template = "(#{Array.new(self.class.send(:search_fields).count) { '?' }.join(',')})"
    self.class.sanitize_sql([template, *map_search_values])
  end
end
