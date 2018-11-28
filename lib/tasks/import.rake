require 'csv'

namespace :import do 
	desc "import data from csv files"
	
	task data: :environment do
		types = [
			{class: Customer, name: "customers"},
			{class: Merchant, name: "merchants"},
			{class: Item, name: "items"},
			{class: Invoice, name: "invoices"},
			{class: Transaction, name: "transactions"},
			{class: InvoiceItem, name: "invoice_items"}
		]

		types.each do |type|
			count = 0
			filename = File.join Rails.root, "/lib/csv/#{type[:name]}.csv"
			CSV.foreach(filename, headers: true) do |row|
				entry = type[:class].create!(row.to_h)
			count +=1 if entry.persisted?
			end
			puts "Imported #{count} new entries to database!"
		end
	end
	
end