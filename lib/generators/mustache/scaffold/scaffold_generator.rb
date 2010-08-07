require 'generators/mustache'
require 'rails/generators/erb/scaffold/scaffold_generator'

class Mustache
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      # TODO Find solution for content_for :target and yield :target

      def create_layout_files
        
        view_layouts_path     = "app/views/layouts"
        template_layouts_path = "app/templates/layouts"
      
        empty_directory view_layouts_path
        empty_directory template_layouts_path
        
        copy_file "views/application.rb", File.join(view_layouts_path, "application.rb")
        copy_file "templates/application.html.mustache", File.join(template_layouts_path, "application.html.mustache")
      end

      def copy_view_files
        views = available_views
        views.delete("index") if options[:singleton]

        views.each do |view|                  
          template "views/#{view}.rb.erb", 
                   File.join("app/views", controller_file_path, "#{view}.rb")
          template "templates/#{view}.html.mustache.erb", 
                   File.join("app/templates", controller_file_path, "#{view}.html.mustache")
        end
        
        template "templates/_form.html.mustache.erb", 
                   File.join("app/templates", controller_file_path, "_form.html.mustache")
      end
      
      private
      
      def available_views
        %w(index edit show new)
      end

    end
  end
end
