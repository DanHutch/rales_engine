require 'rails_helper'

RSpec.describe Customer, type: :model do
 	it {should have_many(:invoices)}

	it "can return associated invoice ids" do
		customer = create(:customer)
		invoices = create_list(:invoice, 6, customer: customer)
		ids = invoices.map {|inv| inv.id}

		expect(customer.invoice_ids.count).to eq(6)
		expect(customer.invoice_ids).to eq(ids)
	end

end

