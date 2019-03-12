class Api::PicturesController < ApplicationController

  def index
    @pictures = Picture.all

    search_terms = params[:search]
    if search_terms
      @pictures = @pictures.where("name iLIKE ?", "%#{search_terms}")  
    end

    @pictures = @pictures.order(:id => asc)
    render 'index.json.jbuilder'
  end

  def create
    @picture = Picture.new(
                           image_url: params[:image_url] 
                          )

    if picture.save
      render 'show.json.jbuilder'
      else
      render json: { errors: @picture.errors.full_messages }, status: :unprocessable_entity   
    end
  end 

  def update
    @picture = Picture.find(params[:id])

    @picture.image_url = params[:image_url] || @picture.image_url
    
    if picture.save
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
