class RunAction < Action
    attr_reader :result

    def unitialized_parameters
		{
			'code': nil
		}
    end

    def set_connector_parameters(connector_parameters)
		@connector_parameters = connector_parameters
	end
    
    def set_action_parameters(action_parameters)
		@action_parameters = action_parameters
    end
    
    def run
        inputs = Class.new

        @connector_parameters.each do |key, value|
            inputs.class_eval { attr_accessor key.to_sym }
            inputs.instance_variable_set "@#{key}", value
            inputs.instance_eval "def #{key}; @#{key}; end"
        end

        code = @action_parameters[:code]

        evalueatedCode = eval("def run_user_script(inputs) #{code} end")

        @result = send(evalueatedCode, inputs)
    end
end