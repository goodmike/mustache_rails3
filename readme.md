## Mustache support for Rails 3

This generator and template handler for Mustache in Rails 3 is based on the 
work of Paul Barry, Louis T., and Martin Gamsjaeger. I am indebted to them for allowing me to stand on their shoulders.

Subclass Mustache::Rails for your view files. Place view files in
app/views/:controller/:action.rb. 

Mustache::Rails registers a TemplateHandler for ".rb" files. Templates go in
app/templates/:controller/:action.format.mustache

To activate mustache templating, require this file in your Rails runtime. 
Placing the file config/initializers/mustache.rb into your config/initializers folder
accomplishes this.

TODO - Think about allowing to overwrite layout methods in subclassing views
http://github.com/defunkt/mustache/blob/master/lib/mustache/sinatra.rb#L79-82
http://github.com/defunkt/mustache/blob/master/lib/mustache/sinatra.rb#L96-102
