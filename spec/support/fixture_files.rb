# frozen_string_literal: true

module FixtureFileHelpers
  extend self

  def fixture_path(filename, dir: 'spec/fixtures')
    File.absolute_path(File.join(dir, filename))
  end
end

RSpec.configure do |config|
  config.include FixtureFileHelpers
end
