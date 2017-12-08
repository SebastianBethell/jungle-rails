class ReviewsController < ApplicationController


  before_action :require_login

  def create
    @review = Review.new(review_params)
    @product = Product.find params[:product_id]
    @review.product = @product
    @user = current_user
    @review.user_id = @user.id


    if @review.save
      redirect_to @product, notice: 'Your review was successfully submitted.  Thank you!'
    else
      redirect_to @product, notice: 'Your review was NOT submitted.  Your review needs both a description and a rating!'
    end

  end

  private

    def review_params
      params.require(:review).permit(:description, :rating, :product_id, :user_id)
    end

    def require_login
      unless current_user?
        redirect_to @product, notice: "You must be logged in to write a review!"
      end
    end

end
