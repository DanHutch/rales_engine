require 'csv'

namespace :import do 
	desc "import merchants from csv file"

	types = {
					# "customers" 		=> Customer,
					# "invoice_items" => InvoiceItem,
					# "invoices" 			=> Invoice,
					# "items" 				=> Item,
					"merchants"			=> Merchant,
					# "transactions"	=> Transaction
	}

	task data: :environment do
		types.each do |name, type|
			filename = File.join Rails.root, "/lib/csv/#{name}.csv"
			CSV.foreach(filename, headers: true) do |row|
				type.create(row.to_h)
			end
		end
	end
	
end