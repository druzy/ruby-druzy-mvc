module Druzy
  module MVC
    
    class ControllerWithResult < Druzy::MVC::Controller
      def initialize(model)
        super(model)
      end
      
      def result
        if @model.result == nil
          @model.stopped_thread=Thread.current
          Thread.stop
        end
        return @model.result
      end
      
    end
    
    class ModelWithResult < Druzy::MVC::Model
      attr_accessor :result, :stopped_thread
      
      def initialize
        super()
        
        @result = nil
        @stopped_thread = nil
      end
      
      def result=(result)
          @result = result
          if @stopped_thread != nil
            @stopped_thread.wakeup
          end
      end
    end
    
  end
end
