# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Clearance::Authentication
  include ActiveStorage::SetCurrent
  protect_from_forgery

  before_action :set_title

  def set_title
    @title = 'Practice Rope'
  end
end
