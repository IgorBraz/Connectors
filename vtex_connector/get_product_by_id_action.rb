require 'rest_connector'

class GetProductByIdAction		
	attr_reader :result

	def unitialized_parameters
		{
			'id': nil
		}
	end

	def set_connector_parameters(connector_parameters)
		@connector_parameters = connector_parameters
	end

	def set_action_parameters(action_parameters)
		@action_parameters = action_parameters
	end
	
	def run
		productId = @action_parameters[:id]

		account = @connector_parameters[:account]

		environment = @connector_parameters[:environment]

		app_key = @connector_parameters[:"x-vtex-api-appkey"]

		app_token = @connector_parameters[:"x-vtex-api-apptoken"]

		rest_connector = RestConnector.new

		endpoint = "https://#{account}.#{environment}.com.br/api/catalog_system/pvt/products/ProductGet/#{productId}"

		headers = { 'x-vtex-api-appkey' => app_key, 'x-vtex-api-apptoken' => app_token }

		@result = rest_connector.get endpoint, headers
	end
end