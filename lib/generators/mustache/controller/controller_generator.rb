require 'generators/mustache'
require 'rails/generators/named_base'

class Mustache
  module Generators
    class ControllerGenerator < ::Rails::Generators::NamedBase
      extend TemplatePath
      
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def create_view_files
        model_path             = File.join(class_path, file_name)
        
        mustache_view_path     = File.join("app/views", model_path)
        empty_directory mustache_view_path
        
        mustache_template_path = File.join("app/templates", model_path)
        empty_directory mustache_template_path
        
        view_layouts_path     = "app/views/layouts"
        template_layouts_path = "app/templates/layouts"
        
        empty_directory view_layouts_path
        empty_directory template_layouts_path
        
        copy_file "views/application.rb", File.join(view_layouts_path, "application.rb")
        copy_file "templates/application.html.mustache", File.join(template_layouts_path, "application.html.mustache")
        
        actions.each do |action|
          @action  = action
          view_path     = File.join(mustache_view_path,
                                    "#{action}.rb")
          template_path = File.join(mustache_template_path,
                                    "#{action}.html.mustache")
          
          template  "views/view.rb.erb", view_path
          template  "templates/view.html.mustache.erb", template_path
          
        end
      end
      
      protected
      
      # Methods not to be executed go here
      
    end
  end
end