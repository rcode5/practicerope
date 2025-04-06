# frozen_string_literal: true

if Rails.application.config.active_storage.service == :amazon
  access_key_id = Rails.application.credentials.dig(:aws, :access_key_id)
  secret_access_key = Rails.application.credentials.dig(:aws, :secret_access_key)

  credentials = Aws::Credentials.new(access_key_id, secret_access_key)
  Aws.config.update(credentials:)
end
