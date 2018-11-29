class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  
  binding.pry
  attributes :revenue do |object|
    object.to_f / 100
  end
end
