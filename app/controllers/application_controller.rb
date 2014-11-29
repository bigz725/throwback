class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_title_variable
  
  private
  def create_title_variable
    @title = ''
  end
end
