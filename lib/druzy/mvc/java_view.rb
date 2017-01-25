require_relative '../mvc'

require 'json'
require 'open3'

module Druzy
  module MVC

    class JavaView < View

      def initialize(controller, dir_java, name_java_class)
        super(controller)

        @dir_java = dir_java
        @name_java_class = name_java_class
        @stdin , @stdout, @sterr = Open3.popen3('java -cp /usr/share/java/gson.jar:'+@dir_java+' '+@name_java_class)
        Thread.new do
          hash = JSON.parse(@stdout.gets)
          while hash['action'] != 'exit' do
            hash['kwargs'] ||= {}
            Thread.new do
              @controller.notify_action(self,hash['action'].to_sym,hash['kwargs'])
            end
            hash = JSON.parse(@stdout.gets)
          end
          @stdin.close
          @sterr.close
        end

      end

      def display
        @stdin.puts({:action => 'display'}.to_json)
      end

      def close
        @stdin.puts({:action => 'exit'}.to_json)
      end

    end

  end
end
