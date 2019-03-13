class Api::UsersController < ApplicationController
# before_action :authenticate_admin, only: [:index, :show] 
  def index
    @users = User.all

    # search_terms = params[:search]
    # if search_terms
    #   @users = @users.where("name iLIKE ?", "%#{search_terms}%")
    # end
    # @users.order(:id => :asc)

    render 'index.json.jbuilder'
  end

  def create
    @user = User.new(
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    ) 
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'    
  end

  def update
    @user = User.find(params[:id])

    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @user.errors.full_messages}, status: :unprocessable_entity  
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "Successfully removed user."}   
  end

end
