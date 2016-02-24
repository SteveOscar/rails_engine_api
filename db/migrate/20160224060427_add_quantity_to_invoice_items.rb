class AddQuantityToInvoiceItems < ActiveRecord::Migration
  def change
    add_column :invoice_items, :quantity, :integer
  end
end
