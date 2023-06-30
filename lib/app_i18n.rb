# frozen_string_literal: true

module AppI18n
  extend ActiveSupport::Concern

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
