$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib/winding-polygon', __FILE__)
#Dir["../../lib/winding-polygon/*.rb"].each {|file| require file }
require 'avltree.rb'
require 'event_queue'
require 'point'
require 'polygon'
require 'segment'
require 'sweep_line'
require 'winding-polygon'
require 'json'
require "rspec"

