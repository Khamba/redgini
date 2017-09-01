class ProductsController < ApplicationController

  def index
    @categories = Category.all
    filters = parse_filters(params)
    @products = Product.all.where(filters)
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
  
    def parse_filters
      # TODO
    end
    
    def product_params
      # TODO
      params.require(product).permit()
    end

end
