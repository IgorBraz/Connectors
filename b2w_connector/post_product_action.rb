class PostProductAction < Action
    attr_reader :result
    
    def unitialized_parameters
		{
			'product': nil
		}
    end
    
    def run
        # @connector_parameters[:'x-user-email']
        # @connector_parameters[:'x-api-key']
        # @connector_parameters[:'x-accountmanager-key']
        # @connector_parameters[:'content-type']
        body = @action_parameters[:product]

        rest_connector = RestConnector.new

        endpoint = "https://api.skyhub.com.br/products"

        headers = @connector_parameters

        @result = rest_connector.post endpoint, headers, body
    end
end