class ApplicationController < ActionController::Base
  helper_method %i[helper_back_path taction tflash]

  ALLOWED_FORMATS = %i[html json].freeze

  before_action :check_request_format

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

  def tflash(status = :notice, **params)
    params = tflash_params_build(params)

    translate = "#{t("activerecord.models.#{params[:model]}")} #{t("flash.actions.#{params[:action]}.#{status}")}"
    translate += params[:add_message] if params[:add_message]
    translate = params[:message] if params[:message]

    if params[:only_translate]
      translate
    else
      { "#{status}": translate }
    end
  end

  private

  def tflash_params_build(params)
    params[:only_translate] ||= false
    params[:action] ||= action_name
    params[:model] ||= controller_name.classify.downcase
    params
  end
end
