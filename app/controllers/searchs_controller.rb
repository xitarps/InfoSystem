class SearchsController < ApplicationController
  before_action :authenticate_user!
  def show
    @lang = locale.to_s.eql?('es') ? '_es' : '_pt_br'

    @result = if params[:search].blank? || params[:search][:query].blank?
                []
              else
                fetch_videos + fetch_articles
              end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end

  def fetch_videos
    Video.where("title#{@lang} like ? OR description#{@lang} like ?",
                "%#{search_params[:query]}%", "%#{search_params[:query]}%")
  end

  def fetch_articles
    Article.where("title#{@lang} like ? OR description#{@lang} like ?",
                  "%#{search_params[:query]}%", "%#{search_params[:query]}%")
  end
end
