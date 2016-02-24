class Api::V1::Merchants::MerchantsRevenueController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.total_revenue_merchant(params[:id]) unless params['date']
    respond_with Merchant.revenue_by_date_merchant(params[:id], params['date']) if params['date']
  end

  def index
    respond_with Merchant.most_revenue_all_merchants(params[:quantity].to_i)
  end

end
