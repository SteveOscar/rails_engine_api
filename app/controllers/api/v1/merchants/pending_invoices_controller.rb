class Api::V1::Merchants::PendingInvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.pending_invoice_customers(params[:id].to_i)
  end

end
