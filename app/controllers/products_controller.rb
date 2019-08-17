require 'pry'

class ProductsController < ApplicationController

 before_action :authenticate_user!, except: :index

  def index
    @american_made = Product.murica
    @top = Product.three_most_recent
    @most_reviewed = Product.most_reviews
    render :index
  end

  def all
    @products = Product.all
    render :all
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added to database"
      redirect_to all_products_path
    else
      render :all
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product= Product.find(params[:id])
    @product.save
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end
  end

  def search
    @q = "%#{params[:query].capitalize}%"
    @products = Product.where("name LIKE ?", @q)
    render :all
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
