class ApplicationController < ActionController::Base
  ALLOWED_FORMATS = %i[html].freeze

  before_action :check_request_format

  private

  def check_request_format
    render request.format, status: :unsupported_media_type if ALLOWED_FORMATS.include?(request.format)
  end

  def tflash(status = :notice, **options)
    options[:action] ||= action_name
    options[:model] ||= controller_name.classify.downcase
    translate = "#{t("activerecord.models.#{options[:model]}")} #{t("flash.actions.#{options[:action]}.#{status}")}"
    { "#{status}": translate }
  end
end
