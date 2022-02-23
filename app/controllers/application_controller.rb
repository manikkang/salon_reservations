# frozen_string_literal: true
class ApplicationController < ActionController::API

	before_action :validate_headers


	def success_json(message = nil, data = nil, status = nil)
    hash = { success: message }
    render json: hash.merge(data), status: status
  end

  def error_json(message = nil, data = {}, status = nil)
    hash = { error: message }
    render json: hash.merge(data), status: status
  end

	private 
	
	def validate_headers
		return error_json(I18n.t('errors.messages.invalid_api_key'), {}, :unauthorized) unless request.headers["x-api-key"] == Rails.application.credentials[:api_key]
	end
end
