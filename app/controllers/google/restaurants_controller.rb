class Google::RestaurantsController < ApplicationController

  def index
    response = RestClient::Request.execute(
        method: :get,
        url: 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.8921364,-87.6370182&radius=900&type=restaurant,formatted_phone_number&keyword=tacos&key=',
        headers: {api_key: ''}
      )

    @restaurants = JSON.parse(response)["results"]
    render 'index.json.jbuilder' 
  end

  def show
    response = RestClient::Request.execute(
      method: :get,
      url: "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{params[:place_id]}&fields=name,rating,formatted_phone_number,user_ratings_total,vicinity,photo,icon,website&key=",
     headers: {api_key: ''}
      )

    @restaurant = JSON.parse(response)["result"]

    puts "*" * 50
    puts "*" * 50
    p @restaurant
    puts "*" * 50
    puts "*" * 50

    render json: @restaurant
  end
end

