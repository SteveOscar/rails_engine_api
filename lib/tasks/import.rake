require 'csv'

desc "Import data"
task :import => [:environment] do

  file = "vendor/customers.csv"
  CSV.foreach(file, :headers => true) do |row|
    Customer.create! row.to_h
  end

  file = "vendor/invoices.csv"
  CSV.foreach(file, :headers => true) do |row|
    Customer.create! row.to_h
  end

end
