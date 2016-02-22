class Api::V1::MerchantsController < Api::ApiController
  respond_to :json

  def index
    byebug
    respond_with Merchant.all.pluck(:id)
  end

end
