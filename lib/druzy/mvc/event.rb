module Druzy
  module MVC
    
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