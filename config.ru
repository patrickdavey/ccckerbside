require 'rubygems'
require 'bundler'
require 'dotenv'

Bundler.require
Dotenv.load

require './web'
use Rack::Static, :urls => ['/images'], :root => 'public'
run MySinatraApp
