class Api::V1::InvoiceItems::InvoiceItemsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id]) if params[:id]
    respond_with InvoiceItem.find_by(item_id: params[:item_id]) if params[:item_id]
    respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with InvoiceItem.where(quantity: params[:quantity]).first if params[:quantity]
    respond_with InvoiceItem.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with InvoiceItem.where(created_at: DateTime.parse(params[:created_at])).first if params[:created_at]
    respond_with InvoiceItem.where(updated_at: DateTime.parse(params[:updated_at])).first if params[:updated_at]
  end

  def index
    respond_with InvoiceItem.where(item_params)
  end

  private

    def item_params
      params.permit(:id,
                    :name,
                    :unit_price,
                    :item_id,
                    :created_at,
                    :updated_at,
                    :quantity,
                    :invoice_id)
    end

end
