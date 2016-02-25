class Api::V1::Items::ItemsRandomController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.limit(1).order("RANDOM()")
  end

end
