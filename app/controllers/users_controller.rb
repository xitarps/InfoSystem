class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: %i[show toggle_admin toggle_ban]
  before_action :fetch_users, only: %i[index]

  def index
    @users = User.all
    friends = current_user.friends
    @nonfriends = User.all.where.not('id == ?', current_user.id) - friends
  end

  def show
    @user = User.find(params[:id])
  end

  def toggle_admin
    @user = User.find(params[:user][:id])

    return redirect_to @user if ToggleAdmin.change(user_params)

    render :show
  end

  def toggle_ban
    @user = User.find(params[:user][:id])

    return redirect_to @user if ToggleBan.change(user_params)

    render :show
  end

  private

  def fetch_users
    @users = User.all.order(name: :asc)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin, :id)
  end
end
