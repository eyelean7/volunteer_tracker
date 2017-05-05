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
  @projects = Project.all()
  erb(:projects)
end

post('/projects') do
  name = params.fetch("name")
  project = Project.new({:name => name, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/volunteers') do
  erb(:volunteers)
end
