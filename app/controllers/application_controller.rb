# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :current_user

  private

  def init_session
    session[:init] = true
  end

  def current_user
    if session[:token]
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify(session[:token])
      @current_user ||= User.find(token)
    end
  end

  def check_login
    redirect_to(login_url, alert: 'Not Authorized') if current_user.nil?
  end

  def authorize
    redirect_to(root_url, alert: 'Not Authorized') if current_user.nil? || !current_user.admin
  end

  helper_method :current_user
end


# p session[:token]
# p "the variables ************************************************   #{cookies[:token] }"
# puts "im here now  ************************* #{session[:session_id]}" 
# puts "this is my token #{token}"
# @current_user ||= User.find(session[:token]) if session[:token]next