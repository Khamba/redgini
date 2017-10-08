class CategoriesController < ApplicationController
  before_action :restrict_access_to_admin

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successgully created!"
      redirect_to categories_url
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def update
    @category = Category.find(params[:category_id])
    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated!"
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @category.destroy
    redirect_to categories_url
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

end
