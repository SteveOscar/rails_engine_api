class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :ivoice_items

  scope :successful, -> { joins(:transactions).where("result = 'success'") }

  def self.by_date(date)
    where("created_at = #{date}")
  end
end
