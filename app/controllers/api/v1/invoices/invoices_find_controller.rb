class Api::V1::Invoices::InvoicesFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id]) if params[:id]
    respond_with Invoice.find_by(customer_id: params[:customer_id]) if params[:customer_id]
    respond_with Invoice.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Invoice.find_by(status: params[:status]) if params[:status]
    respond_with Invoice.find_by(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Invoice.find_by(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
  end

  def index
    respond_with Invoice.where(customer_id: params[:customer_id]) if params[:customer_id]
    respond_with Invoice.where(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Invoice.where("lower(invoices.status) LIKE '#{params[:status].downcase}'") if params[:status]
    respond_with Invoice.where(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Invoice.where(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
    respond_with Invoice.where(id: params[:id]) if params[:id]
  end

end
