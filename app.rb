require 'sinatra'
require 'better_errors'
require 'sinatra/reloader'
require 'pry'
require "sinatra/activerecord"
require 'pg'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
"Hello World"
end