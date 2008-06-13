#require 'rubygems'
#gem 'soap4r'
#require 'soap4r'
Dir[File.join(File.dirname(__FILE__), 'billing_web_service/**/*.rb')].sort.each { |lib| require lib }