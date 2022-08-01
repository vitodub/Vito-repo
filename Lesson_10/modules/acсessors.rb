module Acсessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_history = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history") { instance_variable_get(var_history) }

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(var_history, (instance_variable_get(var_history) || []).push(value))
      end

    end
  end

end

def strong_attr_accessor(name, v_class)
  var_name = "@#{name}".to_sym
  define_method(name) { instance_variable_get(var_name) }
  define_method("#{name}=".to_sym) do |value|
    raise "Тип присваемоего значения отличается" unless value.class.is_a?(v_class)
    instance_variable_set(var_name, value)
  end
end
