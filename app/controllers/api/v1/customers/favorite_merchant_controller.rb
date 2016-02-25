class Api::V1::Customers::FavoriteMerchantController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.favorite_merchant(params[:id])
  end

end
