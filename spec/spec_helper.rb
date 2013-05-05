$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir["../lib/winding-polygon/*.rb"].each {|file| require file }
require 'winding-polygon'
require 'json'
require "rspec"

