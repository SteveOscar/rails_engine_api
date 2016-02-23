class RemoveUnitPriceFromInvoiceItems < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :unit_price, :string
  end
end
