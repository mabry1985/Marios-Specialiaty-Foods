class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :index
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    render :new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "Review added to database"
      redirect_to product_reviews_path(@product)
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
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body)
  end


end
