$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'inventory'
require 'inventory/bag'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
