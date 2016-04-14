require "druzy/mvc/version"
require "druzy/mvc/event"

module Druzy
  
  module MVC
    class Controller
      attr_reader :views
      attr_accessor :model
      
      def initialize(model)
        @model=model
        @views=[]
      end
      
      def add_view(view)
        @views << view
        @model.add_property_change_listener(view)
      end
      
      def remove_view(view)
        @views.delete(view)
        @model.remove_property_change_listener(view)
      end
       
      def display_views
        for view in @views
          view.display()
        end
      end    
      
      def close_views
        for view in @views
          view.close()
        end
      end
        
      def views_on_top
        for view in @views
          view.on_top()
        end
      end  
              
      def notify_action(view,action,kwargs={})
      end            
    end
    
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
    
    class View
      attr_accessor :controller
  
      def initialize(controller)
        @controller=controller
      end
            
      def display
      end
          
      def close
      end
          
      def is_displaying
        return true
      end  
      
      def on_top
      end
          
      def property_change(property_change_event)
      end        
    end
  end
  
end