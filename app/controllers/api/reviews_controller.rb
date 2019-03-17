class Api::ReviewsController < ApplicationController
# before_action :authenticate_admin
  def index
    @reviews = Review.all

    # search_terms = params[:search]
    # if search_terms
    #   @reviews = @reviews.where("name iLIKE ?", "%#{search_terms}")
    # end

    render 'index.json.jbuilder'
  end  

  def create
    @review = Review.new(
                         user_id: current_user.id,
                         restaurant_id: params[:restaurant_id],
                         content: params[:content],
                         taco_points: params[:taco_points]
                         )
    if @review.save
      render json: { message: "Review created successfully" }, status: :created
     else
      render json: { errors: review.errors.full_messages }, status: :bad_request
    end    
  end

  def show
    @review = Review.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @review = Review.find(params[:id])

    @review.content = params[:content] || @review.content
    @review.taco_points = params[:taco_points] || @review.taco_points  
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json:{message: "Sucessfully removed review."}
    
  end

end
