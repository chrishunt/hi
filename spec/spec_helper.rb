require 'pry'
require 'mute'
require 'coveralls'

Mute::IO.capture_stdout
Coveralls.wear!

ENV['RACK_ENV'] = 'test'
