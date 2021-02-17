class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def create
    if params.include?(:friend_id) # individual
      Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
    else  # many
      params[:user][:friend_ids].each do |friend_id|
        Friendship.create_reciprocal_for_ids(current_user.id, friend_id)
      end
    end
    redirect_to users_path
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
  end
end
