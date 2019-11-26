# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  # before_action :check_login, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :index, :edit, :update, :destroy]
  # TODO: make accessible only to admins
  # Only admin users can access this view
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_url, notice: 'Thank you for signing up!')
    else
      render('new')
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :f_name, :l_name, :user_name)
  end
end
