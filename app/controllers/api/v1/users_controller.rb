class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :user_paramas, only: [:create, :update]
  def index
    @users = User.all
    render json: @users
  end

  def show
  end

  def create
    @user = User.new(user_paramas)
    if @user.save
      render json: @user
    else
      render error: { error: 'unable to  creat User.' }, status: 400
    end
  end

  def update
    if @user.update(user_paramas)
      render json: { message: 'succesfuly updated.' }, status: 200
    else
      render error: { error: 'unable to  updated.' }, status: 400
    end
  end

  private

  def set_user
    @user = User.find(paramas[:id])
  end

  def user_paramas
    paramas.require(:user).permit(:username, :password)
  end
end
