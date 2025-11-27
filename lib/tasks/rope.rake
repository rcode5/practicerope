# frozen_string_literal: true

require 'uri'
require_relative '../s3'

namespace :rope do
  namespace :db do
    desc 'Reset user passwords'
    task reset_user_passwords: [:environment] do
      User.find_each do |u|
        u.password = 'monkey'
        u.save
      end
    end
  end
  namespace :search do
    desc 'Search Re-index'
    task reindex_tracks: [:environment] do
      Track.reindex_all
    end
  end
end
