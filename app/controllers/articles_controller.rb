class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, except: %i[index show]
  before_action :set_article, only: %i[edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    return redirect_to @article if @article.save

    render :new
  end

  def update
    return redirect_to @article if @article.update(article_params)

    render :edit
  end

  def destroy
    return redirect_to articles_url if @article.destroy
  end

  private

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title_pt_br, :title_es, :description_pt_br,
                                    :description_es, category_ids: [])
  end
end
