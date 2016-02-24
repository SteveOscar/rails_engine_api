class RemoveQuantityFromInvoiceItems < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :quantity, :string
  end
end
