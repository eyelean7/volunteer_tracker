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
  @projects = Project.all()
  @volunteers = Volunteer.all()
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

delete('/projects') do
  @project = Project.find(params[:id].to_i())
  @project.delete_project()
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update_project({:name => params.fetch("name")})
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get('project/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

post('project/:id/volunteers') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  project_id = params.fetch("project_id")
  volunteer = Volunteer.new({:first_name => first_name, :last_name => last_name, :project_id => project_id, :id => nil})
  volunteer.save()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:volunteer)
end

patch('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  @volunteer.update_volunteer({:first_name => params.fetch("first_name"), :last_name => params.fetch("last_name")})
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:volunteer)
end

delete('/volunteers') do
  @volunteer = Volunteer.find(params[:id].to_i())
  @volunteer.delete_volunteer()
  @volunteers = Volunteer.all()
  erb(:volunteers)
end
