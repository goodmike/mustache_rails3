## Mustache support for Rails 3

This generator and template handler for Mustache in Rails 3 is based on the 
work of Paul Barry, Louis T., and Martin Gamsjaeger. I am indebted to them for allowing me to stand on their shoulders.

Subclass Mustache::Rails for your view files. Place view files in
app/views/:controller/:action.rb. 

Mustache::Rails registers a TemplateHandler for ".rb" files. Templates go in
app/templates/:controller/:action.format.mustache

This is also available as a [rubygem](http://rubygems.org/gems/mustache_rails3).

I'm just getting started. This really is a low-numbered prerelease. :-) I have asked for comments on [the mustache project's Rails Support issue ticket](http://github.com/defunkt/mustache/issues/#issue/3/comment/294928). Please leave feedback there, and thanks.

### Instructions

A Rails 3 reminder: be sure to add 
    gem 'mustache' 
to your project's Gemfile before running any generators or starting the server.
If you're using the mustache_rails3 gem, be sure to also add
    gem 'mustache_rails3'

You can enable the mustache template handler by running
    rails g mustache:install
in your project directory.

### TODO:

* Enable mustache layout usage (uses default application.erb for now)
* Add controller-retrofit generator to build default mustache views for existing controllers
* Generate different fields for different attribute types
* Think about allowing to overwrite layout methods in subclassing views:
  http://github.com/defunkt/mustache/blob/master/lib/mustache/sinatra.rb#L79-82
  http://github.com/defunkt/mustache/blob/master/lib/mustache/sinatra.rb#L96-102
