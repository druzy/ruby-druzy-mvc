require_relative 'view'

require 'gtk3'

module Druzy
  module MVC

    class GTK3View < Druzy::MVC::View

      def initialize(controller, ui_file)
        super(controller)

        @builder = Gtk::Builder.new
        @builder.add_from_file(ui_file)

        @window = builder.get_object('window')
        @window.signal_connect('delete-event') do
          Thread.new do
            @controller.notify_action(self,:cross_clicked)
          end
        end

      end

      def display
        @window.show_all
      end

      def close
        @window.destroy
      end

    end

  end
end
