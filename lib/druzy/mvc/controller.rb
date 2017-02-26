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

  end

end
