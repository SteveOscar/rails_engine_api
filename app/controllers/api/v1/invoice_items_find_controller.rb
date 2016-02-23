class Api::V1::InvoiceItemsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id]) if params[:id]
    respond_with InvoiceItem.find_by(item_id: params[:item_id]) if params[:item_id]
    respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with InvoiceItem.find_by(quantity: params[:quantity]) if params[:quantity]
    respond_with InvoiceItem.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with InvoiceItem.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def index
    respond_with InvoiceItem.where("lower(invoice_items.item_id) LIKE '#{params[:item_id].downcase}'") if params[:item_id]
    respond_with InvoiceItem.where("lower(invoice_items.invoice_id) LIKE '#{params[:invoice_id].downcase}'") if params[:invoice_id]
    respond_with InvoiceItem.where("lower(invoice_items.quantity) LIKE '#{params[:quantity].downcase}'") if params[:quantity]
    respond_with InvoiceItem.where("lower(invoice_items.created_at) LIKE '#{params[:created_at].downcase}'") if params[:created_at]
    respond_with InvoiceItem.where("lower(invoice_items.updated_at) LIKE '#{params[:updated_at].downcase}'") if params[:updated_at]
    respond_with InvoiceItem.find(params[:id]) if params[:id]
  end

end
