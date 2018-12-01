class InvoiceDate

	attr_reader :created_at, :id
	
	def initialize(created_at)
		@created_at = created_at
	end

end