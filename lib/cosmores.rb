require "cosmores/version"
require 'active_support'
require 'active_support/core_ext'
require 'faraday'
require 'faraday_middleware'
require 'json'
require 'virtus'


require 'cosmores/hash_converter'
require 'cosmores/client'
require 'cosmores/booking'
require 'cosmores/room'


module Cosmores
  # Your code goes here...
  DEFAULT_CA_BUNDLE_PATH = File.dirname(__FILE__) + '/data'
end
