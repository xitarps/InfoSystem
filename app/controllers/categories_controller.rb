class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  def index
    @categories = Category.where(language: locale.to_s)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.language = locale.to_s
    return redirect_to @category if @category.save

    render :new
  end

  def show
    find_category
  end

  private

  def category_params
    params.require(:category).permit(:name, :language, category_ids: [])
  end

  def find_category
    @category = Category.find(params[:id])
  end
end