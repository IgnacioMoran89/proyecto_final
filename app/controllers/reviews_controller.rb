class ReviewsController < InheritedResources::Base
  before_action :set_review, only: [:show, :index, :edit, :update, :destroy]
  before_action :set_shop_profile
  

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.shop_profile_id = @shop_profile.id

    if @review.save
      redirect_to @shop_profile
    else
      render 'new'
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_shop_profile
      @shop_profile = ShopProfile.find(params[:shop_profile_id])
    end
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :shop_profile_id)
    end

end
