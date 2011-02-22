
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'active_support/dependencies'


module Rails
  def self.root
    Pathname("/fake/rails/root")
  end
end
require 'mustache_rails'