class Api::V1::InvoiceItemsRandomController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.limit(1).order("RANDOM()")
  end

end
