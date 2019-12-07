# frozen_string_literal: true
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign(user.id)
      session[:token] = token
      redirect_to(root_url, notice: 'Logged in!')
    else
      flash.now.notice = 'Oops that is not what we were expecting'
      render('new')
    end
  end

  def destroy
    session[:token] = nil
    redirect_to(root_url, notice: 'Logged out!')
  end
end
