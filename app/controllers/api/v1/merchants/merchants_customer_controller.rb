class Api::V1::Merchants::MerchantsCustomerController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.best_customer(params[:id])
  end

end
