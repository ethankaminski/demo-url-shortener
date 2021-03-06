require 'sinatra'

use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => File.read("config/session_key.secret")

# escape HTML by default for safety reasons - should prevent a lot of XSS
set :haml, :escape_html => true

# contains some non-Sinatra stuff, to make it easier to manipulate the app via CLI
require_relative 'core.rb'

# load all the routes - no need to be order-specific here
Dir[File.dirname(__FILE__) + '/routes/*.rb'].each {|file| require file }
