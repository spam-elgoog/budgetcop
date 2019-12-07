# frozen_string_literal: true
class UsersController < ApplicationController
  # User must be logged in and authorized to view user related views
  # TODO: before_action :check_login, only: [:show, :edit, :update, :destroy]
  # current user must have admin rights to be able to see and execute these actions
  before_action :authorize, only: [:show, :index, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      # as_json or to_json??
      format.json { render(json: @users.as_json(only: %i[id f_name l_name email user_name])) }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      # as_json or to_json??
      format.json { render(json: @user.as_json(only: %i[id f_name l_name email user_name])) }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:token] = @user.id
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
