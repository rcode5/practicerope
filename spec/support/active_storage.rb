# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    ActiveStorage::Current.url_options = {
      host: 'test.host',
      port: 3000,
    }
  end
end
