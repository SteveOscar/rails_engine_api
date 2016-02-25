class Api::V1::Invoices::InvoicesFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.show_finder(params)
  end

  def index
    respond_with Invoice.index_finder(params)
  end

end
