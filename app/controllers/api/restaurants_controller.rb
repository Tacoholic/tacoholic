class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all

    # search_terms = params[:search]
    # if search_terms
    #   @restaurants = @restaurants.where("name iLIKE ?", "%#{search_terms}")
    # end
    render 'index.json.jbuilder'
  end

  def create
    @restaurant = Restaurant.new(
                                id: params[:id],
                                name: params[:name],
                                address: params[:address],
                                latitude: params[:latitude],
                                longitude: params[:longitude],
                                phone_number: params[:phone_number],
                                website_url: params[:website_url],
                                menu_url: params[:menu_url],
                                hours: params[:hours]
                                )
    if @restaurant.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @restaurant.errors.full_message }, status: :unprocessable_enity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name] || @restaurant.name
    @restaurant.address = params[:address] || @restaurant.address
    @restaurant.latitude = params[:latitude] || @restaurant.latitude
    @restaurant.phone_number = params[:phone_number] || @restaurant.phone_number
    @restaurant.website_url = params[:website_url] || @restaurant.website_url
    @restaurant.menu_url = params[:menu_url] || @restaurant.menu_url
    @restaurant.hours = params[:hours] || @restaurant.hours

    if @restaurant.save
       render 'show.json.jbuilder'
     else
      render json: {errors: @restaurant.errors.full_messages}, status: unprocessable_enity
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    render json: {message: "Successfully Destroyed Restaurant"}
  end

end
