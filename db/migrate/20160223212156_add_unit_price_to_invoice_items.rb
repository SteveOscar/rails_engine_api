class AddUnitPriceToInvoiceItems < ActiveRecord::Migration
  def change
    add_column :invoice_items, :unit_price, :string
  end
end
