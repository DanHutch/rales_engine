class TotalRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total_revenue do |object|
   number = (object.total_revenue / 100.00)
   ('%.2f' % number)
  end
end
