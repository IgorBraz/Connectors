class GetProductsAction
	def parameters
		{
			'page': nil,
			'per_page': nil,
			'total': nil
		}
	end
	
	def run
		puts "Getting all Products"
	end
end