module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

    private
    attr_writer :instances
  end

  module InstanceMethods

# Эту конструкцию я подглядел, но как работает разобрался. Без чужой подскази на метод class_eval наверно бы не вышел
    private
    def register_instance
      self.class.class_eval do 
        self.instances = self.instances.nil? ? 1 : self.instances + 1
        puts self.instances
      end
    end
  end
end
