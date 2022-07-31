odule Validation

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods

    def validations
      @validations ||= []
    end
    # создаем геттер для массива, куда мы складываем валидации. Складываем в переменную экземпляра Class-уровня
  
    def validate(a_name, validation_type, parametr = nil)
      validation = { a_name: a_name, validation_type: validation_type, parametr: parametr } 
      instance_variable_set(:@validations, validations << validation) #Добавляем наши валидации к ранее созданной переменной экземпляра Class-уровня
    end
  end

  module InstanceMethods

    def validate!
      self.class.validations.each do |parametrs|
        a_name, validation_type, parametr = parametrs.values
        value = instance_variable_get("@#{a_name}".to_sym) #обращаемся к переменной экземпляра класса

        case validation_type
        when :presence
          raise "Значение атрибута не может быть nil или пустой строкой" if value.nil? || value == ''
        when :format
          raise "Значение атрибута не соответствует заданному формату" if value !~ parametr
        when :type
          raise "Тип присваемоего значения отличается" unless value.is_a?(parametr)
        else
          puts "Задан неверный тип проверки. Доступные варианты: presence, format, type"
        end
      end
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end
