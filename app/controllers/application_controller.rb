# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit
  include Knock::Authenticable

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    render json: { error: exception.message }, status: :unauthorized
  end
end
