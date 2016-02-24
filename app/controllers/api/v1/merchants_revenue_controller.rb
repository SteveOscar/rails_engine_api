class Api::V1::MerchantsRevenueController < Api::ApiController
  respond_to :json

  def index
    top = Merchant.most_revenue_merchants(params[:quantity])
  end

end
