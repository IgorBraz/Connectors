class Action
	def initialize                   
        @inputs = {}
    end

    def set_connector_parameters(connector_parameters)
		@connector_parameters = connector_parameters
	end

	def set_action_parameters(action_parameters)
		@action_parameters = action_parameters
	end
	
	def set_inputs(action_inputs)
		@inputs = action_inputs
	end

	def add_input(action_input)
		@inputs.merge!(action_input)
	end
end