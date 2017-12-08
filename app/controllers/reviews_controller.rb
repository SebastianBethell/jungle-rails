class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @product = Product.find params[:product_id]
    @review.product = @product
    @review.user_id = current_user


    if @review.save
      redirect_to @product, notice: 'Your review was successfully submitted.  Thank you!'
    else
      flash[:notice] = 'Project saved successfully'
      redirect_to @product, notice: 'Your review was NOT submitted.  Your review needs both a description and a rating!'
    end

  end

  private

    def review_params
      params.require(:review).permit(:description, :rating, :product_id)
    end

end
