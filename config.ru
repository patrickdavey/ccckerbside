require 'rubygems'
require 'bundler'
require 'dotenv'

Bundler.require
Dotenv.load

require './web'
run MySinatraApp
