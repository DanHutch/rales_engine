class Api::V1::FavoriteMerchantController < ApplicationController

  def show
    render json: MerchantSerializer.new(Customer.fav_merchant(Customer.find(params[:id])))
  end
  
end