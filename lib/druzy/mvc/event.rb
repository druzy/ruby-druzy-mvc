module Druzy
  module MVC
    
    class PropertyChangeListener
      def initialize(&block)
        @block = nil
        if block_given?
          @block = block
        end
      end
      
      def property_change(property_change_event)
        @block.call(property_change_event) if @block!=nil
      end
      
      
    end
    
    class PropertyChangeEvent  
      attr_reader :source, :property_name, :old_value, :new_value
  
      def initialize(source, property_name, old_value, new_value)
        @source=source
        @property_name=property_name
        @old_value=old_value
        @new_value=new_value
      end
     end
          
    class IndexedPropertyChangeEvent < PropertyChangeEvent
      attr_reader :index
         
      def initialize(source,property_name,old_value,new_value,index)
        super(source, property_name, old_value, new_value)
        @index=index
      end
    end
   end   
    
end

if $0 == __FILE__
  a = Druzy::MVC::PropertyChangeListener.new do |event|
    puts event.property_name
  end
  
  a.property_change(Druzy::MVC::PropertyChangeEvent.new("nil","coucou","vieux","nouveau"))
  
end