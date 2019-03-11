class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all

    search_terms = params[:search]
    if search_terms
      @restaurants = @restaurants.where("name iLIKE ?", "%#{search_terms}")
    end

    @restaurants = @restaurants.order(id: => :asc)
  end

  def create
    @restaurant = restaurant.new(
                                name: params[:name],
                                address: params[:address],
                                latitude: params[:latitude],
                                longitude: params[:longitude],
                                phone_number: params[:phone_number],
                                website_url: params[:website_url],
                                menu_url: params[:menu_url],
                                hours: params[:hours]
                                )
    if restaurant.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @restaurant.errors.full_message }, status: :unprocessable_enity
    end
  end


end
