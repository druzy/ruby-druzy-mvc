require_relative 'event'

module Druzy

  module MVC

    class View < Druzy::MVC::PropertyChangeListener
      attr_accessor :controller

      def initialize(controller)
        super()
        @controller = controller
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

    end

  end

end
