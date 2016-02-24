class Api::V1::Merchants::MerchantsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

end
