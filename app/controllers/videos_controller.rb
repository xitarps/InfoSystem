class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, except: %i[index show]
  before_action :set_video, only: %i[edit update destroy]

  def index
    @videos = Video.all
  end

  def show
    @comment = Comment.new
    @video = Video.find(params[:id])
    @comments = @video.comments.where(language: locale.to_s)
                      .where(allowed: true)
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.new(video_params)
    return redirect_to @video if @video.save

    render :new
  end

  def edit
  end

  def update
    return redirect_to @video if @video.update(video_params)

    render :edit
  end

  def destroy
    return redirect_to videos_url if @video.destroy
  end

  private

  def set_video
    @video = current_user.videos.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title_pt_br, :title_es, :description_pt_br,
                                  :description_es, :file, category_ids: [])
  end
end
