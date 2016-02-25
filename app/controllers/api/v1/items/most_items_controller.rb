class Api::V1::Items::MostItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.most_items(params['quantity'].to_i)
  end

end
