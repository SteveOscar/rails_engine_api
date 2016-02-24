class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :ivoice_items

  scope :successful, -> { joins(:transactions).where("result = 'success'") }

  scope :pending, -> { joins(:transactions).where("result = 'failed'") }

  scope :by_date, -> (date) { where(created_at: DateTime.parse(date)) }

  scope :by_customer, -> (id) { where(merchant_id: id) }

end
