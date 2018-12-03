class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :revenue do |object|
   '%.2f' % (object.revenue / 100.00)
  end
end
