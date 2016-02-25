class Api::V1::Items::ItemsRevenueController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.most_revenue(params['quantity'].to_i)
  end

end
