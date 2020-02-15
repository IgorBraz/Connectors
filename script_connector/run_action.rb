class RunAction < Action
  attr_reader :result

  def unitialized_parameters
    { "code": nil, "input_names": [] }
  end

  def unitialized_inputs
    { "input_name": nil, "input_value": nil }
  end

  def set_connector_parameters(connector_parameters)
    @connector_parameters = connector_parameters
  end

  def set_action_parameters(action_parameters)
    @action_parameters = action_parameters
  end

  def run
      script_inputs = Class.new

      @inputs.each do |key, value|
        script_inputs.class_eval { attr_accessor key.to_sym }
        script_inputs.instance_variable_set "@#{key}", value
        script_inputs.instance_eval "def #{key}; @#{key}; end"
      end

      code = @action_parameters[:code]

      evalueated_function = eval("def run_user_script(inputs) #{code} end")

      script_result = send(evalueated_function, script_inputs)

      @result = script_result.to_json
  end
end