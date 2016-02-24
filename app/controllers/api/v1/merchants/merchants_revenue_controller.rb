class Api::V1::Merchants::MerchantsRevenueController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.most_revenue_merchants(params[:quantity].to_i)
  end

end
