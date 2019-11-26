# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_login
    redirect_to(login_url, alert: 'Not Authorized') if current_user.nil?
  end

  def authorize
    redirect_to(root_url, alert: 'Not Authorized') if current_user.nil? || !current_user.admin
  end

  helper_method :current_user
end
