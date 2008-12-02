require 'rubygems'

gem 'soup', '>= 0.1.4'
require 'soup'

module Vanilla
  class MissingSnipException < Exception
  end
  
  def self.snip(name)
    snip = Soup[name]
    if snip.is_a?(Array) && snip.empty?
      return nil
    end
    snip
  end
  
  def self.snip!(name)
    snip = snip(name)
    raise MissingSnipException, "can't find '#{name}'" unless snip
  end
  
  def self.snip_exists?(name)
    snip = Soup[name]
    if snip.is_a?(Array) && snip.empty?
      false
    else
      true
    end
  end
end

def dynasnip(*args)
  # do nothing
end
def snip(*args)
  # do nothing
end

# Load all the other renderer subclasses
Dir[File.join(File.dirname(__FILE__), 'vanilla', 'renderers', '*.rb')].each { |f| require f }  

# Load the routing information
require 'vanilla/routes'

# Load all the base dynasnip classes
Dir[File.join(File.dirname(__FILE__), 'vanilla', 'dynasnips', '*.rb')].each do |dynasnip|
  require dynasnip
end