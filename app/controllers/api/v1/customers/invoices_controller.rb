class Api::V1::Customers::InvoicesController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id]).invoices
  end

end
