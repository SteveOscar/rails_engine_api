class Api::V1::Invoices::MerchantController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:id]).merchant
  end

end
