require 'csv'

namespace :import do 
	desc "import merchants from csv file"
	task merchants: :environment do
		filename = File.join Rails.root, "/lib/csv/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
			Merchant.create(row.to_h)
		end
		puts "You now have #{Merchant.count} merchants!"
  end
end