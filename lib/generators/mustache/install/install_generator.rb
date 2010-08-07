require 'generators/mustache'

class Mustache
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      extend TemplatePath

      def copy_initializer_files
        copy_file "config/initializers/mustache.rb", "config/initializers/mustache.rb"
      end
      
      def create_layout_files
        view_layouts_path     = "app/views/layouts"
        template_layouts_path = "app/templates/layouts"
        
        empty_directory view_layouts_path
        empty_directory template_layouts_path
        
        copy_file "app/views/application.rb", File.join(view_layouts_path, "application.rb")
        copy_file "app/templates/application.html.mustache", File.join(template_layouts_path, "application.html.mustache")
      end

    end
  end
end
