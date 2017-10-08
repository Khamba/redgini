class ProductsController < ApplicationController

  layout false, only: :index
  before_action :restrict_access_to_admin, only: [:new, :create, :edit, :destroy]

  def index
    @categories = Category.all
    filters = parse_filters(params)
    @products = Product.all.where(filters)
  end

  def admin_index
    # TODO
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully saved"
      redirect_to products_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_url
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @product.destroy
    redirect_to products_url
  end

  private

    def parse_filters(filters)
      if params[:category_id] and params[:category_id] != "all"
        return { category_id: params[:category_id] }
      else
        return {}
      end
    end

    def product_params
      params.require(:product).permit(:name, :price, :weight, :earliest_delivery, :category_id, :image)
    end

end
