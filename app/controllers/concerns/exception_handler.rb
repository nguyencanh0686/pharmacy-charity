module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  class ExpiredToken < StandardError; end

  class Validation < StandardError; end

  class NormalError < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActiveRecord::RecordInvalid, with: :render_400
    rescue_from ActiveRecord::RecordNotDestroyed, with: :record_errors
    rescue_from ExceptionHandler::AuthenticationError, with: :render_401
    rescue_from ExceptionHandler::MissingToken, with: :unauthorized_request
    rescue_from ExceptionHandler::InvalidToken, with: :unauthorized_request
    rescue_from ExceptionHandler::ExpiredToken, with: :unauthorized_request
    rescue_from ExceptionHandler::Validation, with: :render_400
    rescue_from ExceptionHandler::NormalError, with: :render_422
    rescue_from ActiveRecord::InvalidForeignKey, with: :render_422
    #rescue_from CanCan::AccessDenied, with: :render_422
    rescue_from ArgumentError, with: :render_422

    rescue_from ActiveRecord::RecordNotFound do |e|
      LoggerServices::Logger.exception(e)
      json_response({ message: I18n.t('exception.not_found') }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid, with: :render_422
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def render_400(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: e.message }, :bad_request)
  end

  def render_404(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: e.message }, :not_found)
  end

  def render_401(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: e.message }, :unauthorized)
  end

  def render_422(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  def render_500(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: I18n.t('exception.internal_error') }, :internal_server_error)
  end

  def forbidden(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: I18n.t('exception.internal_error') }, :forbidden)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: e.message }, :unauthorized)
  end

  def record_errors(e)
    LoggerServices::Logger.exception(e)
    json_response({ message: e.record.errors.full_messages }, :unprocessable_entity)
  end
end
