require 'pry'

class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added to database"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    binding.pry
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
