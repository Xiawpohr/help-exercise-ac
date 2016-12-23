class Api::V1::BaseController < ApplicationController
  # protect_from_forgery with: :null_session

  before_action :set_default_format

  # skip_before_action :verify_authenticity_token

  def set_default_format
    request.format = "json"
  end
end