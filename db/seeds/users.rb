# frozen_string_literal: true

require 'devise/encryptor'

def create_users
  return if User.any?

  password = 'password'
  %w[
    one@example.com
    two@example.com
  ].each { |email| User.create!(email:, password:, password_confirmation: password) }
end

create_users
