class Api::InformationsController < ApplicationController

  def show
  response = RestClient::Request.execute(
    method: :get,
    url: 'https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJN1t_tDeuEmsRUsoyG83frY4&fields=name,rating,formatted_phone_number, photo,opening_hours,review&key=AIzaSyD9XLOcSAh_iiObVToMVQ8Wdud0xPjhGbo',
    headers: {api_key: 'AIzaSyD9XLOcSAh_iiObVToMVQ8Wdud0xPjhGbo'}
    )


  JSON.parse(response)["results"].each do |result|
    puts
    p "THIS IS THE TOP====================================================="
    p result["geometry"]
    p result["icon"]
    p "id" result["id"]
    p result["name"]
    p result["opening_hours"]
    p result["photos"]
    p result["place_id"]
    p result["plus_code"]
    p result["price_level"]
    p result["rating"]
    p result["reference"]
    p result["scope"]
    p result["types"]
    p result["user_ratings_total"]
    p result["vicinity"]
    p result.keys
    p "THIS IS THE BOTTOM====================================================="

  end

  @restaurants = JSON.parse(response)["results"]

  # JSON.parse(@restaurants)
    # search_terms = params[:search]
    # if search_terms
    #   @restaurants = @restaurants.where("name iLIKE ?", "%#{search_terms}")
    # end
    
    render 'index.json.jbuilder'

  end

end
