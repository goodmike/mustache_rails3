## Mustache support for Rails 3

This generator and template handler for Mustache in Rails 3 is based on the
work of Paul Barry, Louis T., and Martin Gamsjaeger. I am indebted to them for allowing me to stand on their shoulders.

This is also available as a [rubygem](http://rubygems.org/gems/mustache_rails3).

I'm just getting started. This really is a low-numbered prerelease. :-) I have asked for comments on [the mustache project's Rails Support issue ticket](http://github.com/defunkt/mustache/issues/#issue/3/comment/294928). Please leave feedback there, and thanks.

### Views & Templates

For your view files, subclass Mustache::Rails as (:controller)::(:action) in
app/views/:controller/:action.rb

<pre><code>#app/views/home/index.rb

class Home::Index &lt; Mustache::Rails
  def world
    'New Caprica'
  end
end
</code></pre>

Mustache::Rails registers a TemplateHandler for ".rb" files. Templates go in
app/templates/:controller/:action.format.mustache

<pre><code>#app/templates/home/index.html.mustache

Hello {{world}}!
</code></pre>

### Layouts

Layouts work much the same way, using a similar naming convention. Subclass Mustache::Rails as Layouts::(:layout) in app/views/layouts/:layout.rb

<pre><code>#app/views/layouts/main.rb

class Layouts::Main &lt; Mustache::Rails
  def default_title
    'A Cylon fleet has jumped into orbit!'
  end
end
</code></pre>

Place the template for your layout in app/templates/layouts/:layout.format.mustache

<pre><code>#app/templates/layouts/main.html.mustache

&lt;h1>{{default_title}}&lt;/h1>
{{{yield}}}
</code></pre>

### Instructions

A Rails 3 reminder: be sure to add
<pre><code>gem 'mustache'</code></pre>
to your project's Gemfile before running any generators or starting the server.

If you're using the mustache_rails3 gem, be sure to also add
<pre><code>gem 'mustache_rails3'</code></pre>

You can enable the mustache template handler by running
<pre><code>rails g mustache:install</code></pre>
in your project directory.

### TODO:

* Add controller-retrofit generator to build default mustache views for existing controllers
* Generate different fields for different attribute types
* Think about allowing to overwrite layout methods in subclassing views:
  http://github.com/defunkt/mustache/blob/master/lib/mustache/sinatra.rb#L79-82
  http://github.com/defunkt/mustache/blob/master/lib/mustache/sinatra.rb#L96-102
