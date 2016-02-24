class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at
end
