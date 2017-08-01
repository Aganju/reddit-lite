class SubsController < ApplicationController
  before_action :require_login
  def index
    render :index
  end
end
