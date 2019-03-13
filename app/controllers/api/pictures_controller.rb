class Api::PicturesController < ApplicationController
 # before_action :authenticate_admin
 
  def index
    @pictures = Picture.all

    # search_terms = params[:search]
    # if search_terms
    #   @pictures = @pictures.where("name iLIKE ?", "%#{search_terms}")  
    # end

    # @pictures = @pictures.order(:id => asc)
    render 'index.json.jbuilder'
  end

  def create
    @picture = Picture.new(
                           image_url: params[:image_url], 
                           restaurant_id: params[:restaurant_id],
                           user_id: params[:user_id] 
                          )

    if @picture.save
      render 'show.json.jbuilder'
      else
      render json: { errors: @picture.errors.full_messages }, status: :unprocessable_entity   
    end
  end 

  def update
    @picture = Picture.find(params[:id])

    @picture.image_url = params[:image_url] || @picture.image_url
    @picture.restaurant_id = params[:restaurant_id] || @picture.restaurant_id
    @picture.user_id = params[:user_id] || @picture.user_id
    
    if @picture.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @picture.errors.full_messages }, status: :unprocessable_entity  
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    render json: {message: "Successfully removed picture."}   
  end
end


