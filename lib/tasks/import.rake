require 'csv'

desc "Import data"
task :import => [:environment] do

  file = "vendor/customers.csv"
  CSV.foreach(file, :headers => true) do |row|
    Customer.create! row.to_h
  end

  file = "vendor/merchants.csv"
  CSV.foreach(file, :headers => true) do |row|
    Merchant.create! row.to_h
  end

  file = "vendor/invoices.csv"
  CSV.foreach(file, :headers => true) do |row|
    Invoice.create! row.to_h
  end

  file = "vendor/items.csv"
  CSV.foreach(file, :headers => true) do |row|
    Item.create! row.to_h
    price = Item.last.unit_price
    Item.last.update(unit_price: price.insert(-3, '.'))
    Item.last.update(updated_at: row['updated_at'])
  end

  file = "vendor/transactions.csv"
  CSV.foreach(file, :headers => true) do |row|
    Transaction.create! row.to_h
  end

  file = "vendor/invoice_item.csv"
  CSV.foreach(file, :headers => true) do |row|
    InvoiceItem.create! row.to_h
    price = InvoiceItem.last.unit_price
    InvoiceItem.last.update(unit_price: (price / 100))
    InvoiceItem.last.update(updated_at: row['updated_at'])
  end

end
