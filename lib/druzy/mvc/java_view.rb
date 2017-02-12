require_relative '../mvc'

require 'open3'
require 'xmlsimple'

module Druzy
  module MVC

    class JavaView < View

      def initialize(controller, dir_java, name_java_class)
        super(controller)

        @dir_java = dir_java
        @name_java_class = name_java_class
        @stdin , @stdout, @sterr = Open3.popen3('java -cp '+@dir_java+' '+@name_java_class)

        Thread.new do
          hash = XmlSimple.xml_in(@stdout.gets, :ForceArray => false, :KeyToSymbol => true)

          while hash[:action] != 'exit' do
            hash[:kwargs] ||= {}
            Thread.new do
              @controller.notify_action(self,hash[:action],hash[:kwargs])
            end
            hash = XmlSimple.xml_in(@stdout.gets, :ForceArray => false, :KeyToSymbol => true)
          end
          @stdin.close
          @sterr.close
        end

      end

      def display
        @stdin.puts(XmlSimple.xml_out({:action => 'display'}, :RootName => 'root', :AttrPrefix => true, :NoIndent => true))
      end

      def close
        @stdin.puts(XmlSimple.xml_out({:action => 'exit'}, :RootName => 'root', :AttrPrefix => true, :NoIndent => true))
      end

    end

  end
end
