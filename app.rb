require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require './lib/helper'
require 'pry'
require 'pg'
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  erb(:index)
end

get('/projects') do
  erb(:projects)
end

get('/volunteers') do
  erb(:volunteers)
end
