class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
	  # we need this to call back to the specific restau
	  @restaurant = Restaurant.find(params[:restaurant_id])
	  @review.restaurant = @restaurant

    if @review.save
	  # we need to redirect to the specific restaurant id page, but we need to create it)
	      redirect_to restaurant_path(@restaurant)
    else
    # reload to itself with an error
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private
	def review_params
		params.require(:review).permit(:content, :rating)
	end

end
