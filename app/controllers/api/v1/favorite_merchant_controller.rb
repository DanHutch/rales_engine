class Api::V1::FavoriteMerchantController < ApplicationController

  def show
    id  = params[:id]
    render json: MerchantSerializer.new(Customer.fav_merchant(id))
  end
  
end