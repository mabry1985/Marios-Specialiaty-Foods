class ReviewsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @reviews = Review.all
    render :index
  end

  def new
    @product = Product.find(params[:product_id])
      @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    binding.pry
    if @review.save!
      flash[:notice] = "Review added to database"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review= Review.find(params[:id])
    @review.save
    if @review.update(review_params)
      redirect_to product_reviews_path(@product)
    else
      render :edit
    end
  end

  def destroy
    def destroy
      @product = Product.find(params[:id])
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to product_reviews_path(@product)
    end
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body)
  end


end
