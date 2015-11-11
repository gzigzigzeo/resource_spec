class UsersController < ApplicationController
  respond_to :html

  def new
    build_user
    respond_with(@user)
  end

  def create
    build_user
    @user.save
    respond_with(@user)
  end

  def edit
    find_user
    respond_with(@user)
  end

  def update
    find_user
    @user.attributes = user_params
    @user.save
    respond_with(@user)
  end

  def destroy
    find_user
    @user.destroy
    respond_with(@user)
  end

  private

  def user_params
    params[:user].permit!
  end

  def build_user
    @user = User.new(user_params)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
