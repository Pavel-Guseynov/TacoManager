# frozen_string_literal: true

class ManagerTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
end
