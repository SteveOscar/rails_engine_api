class Api::V1::Invoices::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.joins(:invoice_items).where('invoice_items.invoice_id = ?', params[:id])
  end

end
