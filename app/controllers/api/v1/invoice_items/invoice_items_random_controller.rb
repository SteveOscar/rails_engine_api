class Api::V1::InvoiceItems::InvoiceItemsRandomController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.limit(1).order("RANDOM()")
  end

end
