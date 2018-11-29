require 'rails_helper'

RSpec.describe Merchant, type: :model do
	it{should have_many(:items)}
	it{should have_many(:invoices)}

	it "can return the revenue by date across all merchants" do
		custy = create(:customer)
		merch_1 = create(:merchant)
		merch_2 = create(:merchant)
		merch_3 = create(:merchant)
		item_1 = create(:item, merchant_id: merch_1.id)
		item_2 = create(:item, merchant_id: merch_2.id)
		item_3 = create(:item, merchant_id: merch_3.id)
		invoice_1 = create(:invoice, merchant_id: merch_1.id, customer_id: custy.id, created_at: '2018-04-20')
		invoice_2 = create(:invoice, merchant_id: merch_2.id, customer_id: custy.id, created_at: '2018-04-20')
		invoice_3 = create(:invoice, merchant_id: merch_3.id, customer_id: custy.id, created_at: '2018-04-20')
		invoice_4 = create(:invoice, merchant_id: merch_1.id, customer_id: custy.id, created_at: '2018-04-21')
		ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice_1.id, quantity: 10, unit_price: 1000000 )
		ii_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, quantity: 20, unit_price: 2000000 )
		ii_3 = create(:invoice_item, item_id: item_3.id, invoice_id: invoice_3.id, quantity: 10, unit_price: 3000000 )
		ii_4 = create(:invoice_item, item_id: item_3.id, invoice_id: invoice_4.id, quantity: 10, unit_price: 4000000 )
		tran_1 = create(:transaction, invoice_id: invoice_1.id, result: "success")
		tran_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")
		tran_3 = create(:transaction, invoice_id: invoice_3.id, result: "success")
		tran_4 = create(:transaction, invoice_id: invoice_4.id, result: "success")

		expect(Merchant.revenue_by_date('2018-04-20')).to eq(80000000)
	end

	it "can return top merchants by revenue" do
			custy = create(:customer)
		merch_1 = create(:merchant)
		merch_2 = create(:merchant)
		merch_3 = create(:merchant)
		item_1 = create(:item, merchant_id: merch_1.id)
		item_2 = create(:item, merchant_id: merch_2.id)
		item_3 = create(:item, merchant_id: merch_3.id)
		invoice_1 = create(:invoice, merchant_id: merch_1.id, customer_id: custy.id, created_at: '2018-04-20')
		invoice_2 = create(:invoice, merchant_id: merch_2.id, customer_id: custy.id, created_at: '2018-04-20')
		invoice_3 = create(:invoice, merchant_id: merch_3.id, customer_id: custy.id, created_at: '2018-04-20')
		invoice_4 = create(:invoice, merchant_id: merch_1.id, customer_id: custy.id, created_at: '2018-04-21')
		ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice_1.id, quantity: 10, unit_price: 1000000 )
		ii_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, quantity: 20, unit_price: 2000000 )
		ii_3 = create(:invoice_item, item_id: item_3.id, invoice_id: invoice_3.id, quantity: 10, unit_price: 3000000 )
		ii_4 = create(:invoice_item, item_id: item_3.id, invoice_id: invoice_4.id, quantity: 10, unit_price: 4000000 )
		tran_1 = create(:transaction, invoice_id: invoice_1.id, result: "success")
		tran_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")
		tran_3 = create(:transaction, invoice_id: invoice_3.id, result: "success")
		tran_4 = create(:transaction, invoice_id: invoice_4.id, result: "success")

		expect(Merchant.most_revenue(2)).to eq([merch_1, merch_2])
	end


end
