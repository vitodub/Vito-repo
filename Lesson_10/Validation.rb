# encoding: utf-8

module Validation

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
  attr_accessor :a_name, :validation, :parametr

    def validate(a_name, validation, parametr = nil)
      @a_name = a_name
      @validation = validation
      @parametr = parametr
    end
  end

  module InstanceMethods

    def validate!
      case self.class.validation
      when "presence"
        raise "Значение атрибута не может быть nil или пустой строкой" if (self.class.a_name.nil? || self.class.a_name == '')
      when "format"
        raise "Значение атрибута не соответствует заданному формату" if self.class.a_name !~ self.class.parametr
      when "type"
        raise "Тип присваемоего значения отличается" unless self.class.a_name == self.class.parametr 
      else
        puts "Задан неверный тип проверки. Доступные варианты: presence, format, type"
      end
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end
