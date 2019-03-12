class Api::SessionsController < ApplicationController

  def index
      @users = User.all

      # search_terms = params[:search]
      # if search_terms
      #   @users = @users.where("name iLIKE ?", "%#{search_terms}%")
      # end

      # @users = @users.order(:id => :asc)

      render 'index.json.jbuilder'
    end


  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 720.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
      @user = Restaurant.find(params[:id])
      render 'show.json.jbuilder'
  end

end
 