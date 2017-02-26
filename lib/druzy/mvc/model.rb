module Druzy

  module MVC

    class Model

      def initialize
        @listeners=[]
      end

      def add_property_change_listener(listener)
        @listeners << listener
      end

      def remove_property_change_listener(listener)
        @listeners.delete(listener)
      end

      def fire_property_change(property_change_event)
        for listener in @listeners
          listener.property_change(property_change_event)
        end
      end
    end

  end

end
