Gem::Specification.new do |s|
  s.name = %q{mustache_rails3}
  s.version = "0.1.1"
  s.date = %q{2010-06-28}
  s.authors = ["Michael Harrison"]
  s.email = %q{mh@michaelharrison.ws}
  s.summary = %q{Mustache_rails3 provides a template handler and generators for Rails 3.}
  s.homepage = %q{http://github.com/goodmike/mustache_rails3}
  s.description = %q{Mustache_rails3 is intended to add Rails 3 support to the existing mustache templating system for Ruby. It provides a template handler for Rails 3 and generators. The source code is maintained at http://github.com/goodmike/mustache_rails3, and I welcome comments and forks.}
  s.files = [ "readme.md", "LICENSE", "config/initializers/mustache.rb",
              "lib/generators/mustache.rb",
              "lib/generators/mustache/controller/controller_generator.rb",
              "lib/generators/mustache/controller/templates/view.html.mustache.erb",
              "lib/generators/mustache/controller/templates/view.rb.erb",
              "lib/generators/mustache/install/install_generator.rb",
              "lib/generators/mustache/install/templates/config/initializers/mustache.rb",
              "lib/generators/mustache/scaffold/scaffold_generator.rb",
              "lib/generators/mustache/scaffold/templates/_form.html.mustache.erb",
              "lib/generators/mustache/scaffold/templates/edit.html.mustache.erb",
              "lib/generators/mustache/scaffold/templates/edit.rb.erb",
              "lib/generators/mustache/scaffold/templates/index.html.mustache.erb",
              "lib/generators/mustache/scaffold/templates/index.rb.erb",
              "lib/generators/mustache/scaffold/templates/new.html.mustache.erb",
              "lib/generators/mustache/scaffold/templates/new.rb.erb",
              "lib/generators/mustache/scaffold/templates/show.html.mustache.erb",
              "lib/generators/mustache/scaffold/templates/show.rb.erb",
              "lib/mustache_rails.rb"
            ]
end
