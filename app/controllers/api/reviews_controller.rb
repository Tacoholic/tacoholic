class Api::ReviewsController < ApplicationController

  def index
    @reviews = Review.all

    search_terms = params[:search]
    if search_terms
      @reviews = @reviews.where("name iLIKE ?", "%#{search_terms}")
    end
  end  

  def create
    @review = Review.new(
                         content: params[:content],
                         taco_points: params[:taco_points]
                         )
    if @review.save
      render 'show.json.jbuiler'
    else
      render json: { errors: @reviews.errors.full_messages }, status: :unprocessable_entity
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
    review = Review.find(params[:id])
    review.destroy
    render json:{message: "Sucessfully removed review."}
    
  end

end
