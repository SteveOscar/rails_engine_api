class Api::V1::InvoicesFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id]) if params[:id]
    respond_with Invoice.find_by(customer_id: params[:customer_id]) if params[:customer_id]
    respond_with Invoice.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Invoice.find_by(status: params[:status]) if params[:status]
    respond_with Invoice.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Invoice.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def index
    respond_with Invoice.where("lower(invoices.customer_id) LIKE '#{params[:customer_id].downcase}'") if params[:customer_id]
    respond_with Invoice.where("lower(invoices.merchant_id) LIKE '#{params[:merchant_id].downcase}'") if params[:merchant_id]
    respond_with Invoice.where("lower(invoices.status) LIKE '#{params[:status].downcase}'") if params[:status]
    respond_with Invoice.where("lower(invoices.created_at) LIKE '#{params[:created_at].downcase}'") if params[:created_at]
    respond_with Invoice.where("lower(invoices.updated_at) LIKE '#{params[:updated_at].downcase}'") if params[:updated_at]
    respond_with Invoice.find(params[:id]) if params[:id]
  end

end
