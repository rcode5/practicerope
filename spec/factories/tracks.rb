# frozen_string_literal: true

require_relative '../support/fixture_files'

FactoryBot.define do
  factory :track do
    recorded_on { rand(50).days.ago }
    description { 'set description *with emphasis*' }

    sequence(:title) { |n| "hot new mix #{n}" }
    audio { Rack::Test::UploadedFile.new(FixtureFileHelpers.fixture_path('dummy.mp3')) }
    trait(:published) do
      published { true }
    end
  end
end
