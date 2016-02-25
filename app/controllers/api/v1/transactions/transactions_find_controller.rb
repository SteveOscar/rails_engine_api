class Api::V1::Transactions::TransactionsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id]) if params[:id]
    respond_with Transaction.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.find_by(result: params[:result]) if params[:result]
    respond_with Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date]) if params[:credit_card_expiration_date]
    respond_with Transaction.find_by(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Transaction.find_by(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
  end

  def index
    respond_with Transaction.where(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.where(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.where("lower(transactions.result) LIKE '#{params[:result].downcase}'") if params[:result]
    respond_with Transaction.where("transactions.credit_card_expiration_date LIKE '#{params[:credit_card_expiration_date]}'") if params[:credit_card_expiration_date]
    respond_with Transaction.where(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Transaction.where(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
    respond_with Transaction.where(id: params[:id]) if params[:id]
  end

end
