class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      flash[:success] = 'Thanks for liking!'
    else
      flash[:alert] = @like.errors.full_messages.join(', ')
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = current_user.likes.find_by(reference_id: params[:id])
    @like.destroy

    redirect_back(fallback_location: root_path)
  end

  protected

  def like_params
    params.require(:like).permit(:value, :user_id, :reference_id,
                                 :reference_type)
  end
end
