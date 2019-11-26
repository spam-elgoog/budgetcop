# frozen_string_literal: true
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(root_url, notice: 'Logged in!')
    else
      flash.now.notice = 'Oops that is not what we were expecting'
      render('new')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_url, notice: 'Logged out!')
  end
end
