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

# Понял, работаем с инстанс-переменными уровня класса
    private
    def register_instance
      self.class.instances = self.class.instances.nil? ? 1 : self.class.instances + 1
      puts self.class.instances
    end
  end
end
