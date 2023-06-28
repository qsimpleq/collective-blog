class ApplicationController < ActionController::Base
  helper_method %i[helper_back_path taction tflash]

  ALLOWED_FORMATS = %i[html json].freeze

  before_action :check_request_format

  private

  def check_request_format
    render request.format, status: :unsupported_media_type if ALLOWED_FORMATS.include?(request.format)
  end

  def helper_back_path(**params)
    params[:action_name] ||= action_name
    params[:controller_name] ||= controller_name

    if %w[new show].include?(params[:action_name])
      url_for(controller: params[:controller_name], action: :index, only_path: true)
    elsif %w[edit update].include?(params[:action_name])
      url_for(controller: params[:controller_name], action: :show, only_path: true)
    else
      params[:default_path] || request.referer
    end
  end

  def taction(name = nil)
    action = name || action_name
    action = 'update' if !name && action_name == 'edit'

    t("action.#{action}")
  end

  def tflash(status = :notice, **options)
    options[:only_translate] ||= false
    options[:action] ||= action_name
    options[:model] ||= controller_name.classify.downcase

    translate = "#{t("activerecord.models.#{options[:model]}")} #{t("flash.actions.#{options[:action]}.#{status}")}"
    translate += options[:add_message] if options[:add_message]
    translate = options[:message] if options[:message]

    if options[:only_translate]
      translate
    else
      { "#{status}": translate }
    end
  end
end
