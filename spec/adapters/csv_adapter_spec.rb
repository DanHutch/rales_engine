require 'rails_helper'
require 'rake'

describe "CSV Adapter" do 

	before :all do
		Rake.application.rake_require('tasks/import')
    Rake::Task.define_task(:environment)
	end
	
	it "imports merchants from csv" do
		expect(Merchant.count).to eq(0)

		Rake::Task["import:data"].invoke

		expect(Merchant.count).to eq(100)
	end

end