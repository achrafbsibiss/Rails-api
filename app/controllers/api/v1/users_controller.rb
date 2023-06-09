class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
#   before_action :user_params, only: [:create, :update]
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render error: { error: 'unable to  creat User.' }, status: 400
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { message: 'succesfuly updated.' }, status: 200
    else
      render error: { error: 'unable to  updated.' }, status: 400
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
