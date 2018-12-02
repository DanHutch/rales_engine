class Api::V1::FavoriteCustomerController < ApplicationController

  def show
    render json: CustomerSerializer.new(Merchant.fav_customer(params[:id]))
  end
  
end