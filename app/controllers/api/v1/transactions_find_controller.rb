class Api::V1::TransactionsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id]) if params[:id]
    respond_with Transaction.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.find_by(result: params[:result]) if params[:result]
    respond_with Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date]) if params[:credit_card_expiration_date]
    respond_with Transaction.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Transaction.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def index
    respond_with Transaction.where("lower(transactions.invoice_id) LIKE '#{params[:invoice_id].downcase}'") if params[:invoice_id]
    respond_with Transaction.where("lower(transactions.credit_card_number) LIKE '#{params[:credit_card_number].downcase}'") if params[:credit_card_number]
    respond_with Transaction.where("lower(transactions.result) LIKE '#{params[:result].downcase}'") if params[:result]
    respond_with Transaction.where("transactions.credit_card_expiration_date LIKE '#{params[:credit_card_expiration_date]}'") if params[:credit_card_expiration_date]
    respond_with Transaction.where("lower(transactions.created_at) LIKE '#{params[:created_at].downcase}'") if params[:created_at]
    respond_with Transaction.where("lower(transactions.updated_at) LIKE '#{params[:updated_at].downcase}'") if params[:updated_at]
    respond_with Transaction.find(params[:id]) if params[:id]
  end

end
