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

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get('/volunteers') do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

post('/volunteers') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  volunteer = Volunteer.new({:first_name => first_name, :last_name => last_name, :id => nil})
  volunteer.save()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:volunteer)
end
