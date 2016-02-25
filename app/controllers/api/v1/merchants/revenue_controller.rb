class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.total_revenue(params['date'])
  end

end
