class Api::V1::FavoriteMerchantController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.find(params[:id]))
  end
  
end