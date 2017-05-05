require('capybara/rspec')
require('./app')
require('pry')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('volunteer_tracker', {:type => :feature}) do
  it "goes to projects page and adds a project when the form is submitted" do
    visit('/')
    click_link('Go to projects page')
    expect(page).to have_content('Add a project')
    click_button('Add a project')
    fill_in('name', :with => 'Feed the Children')
    click_button('Submit')
    expect(page).to have_content('Feed the Children')
    click_link('Go Home')
    expect(page).to have_content('What would you like to do?')
  end
  it "routes to an individual project's page and allows an update or delete" do
    visit('/projects')
    click_button('Add a project')
    fill_in('name', :with => 'Feed the Children')
    click_button('Submit')
    click_link('Feed the Children')
    expect(page).to have_content('Project: Feed the Children')
    fill_in('name', :with => 'Meals on Wheels')
    click_button('Update project information')
    click_button('Submit')
    expect(page).to have_content('Project: Meals on Wheels')
  end
  it "goes to the volunteers page when its button is clicked" do
    visit('/')
    click_link('Go to volunteers page')
    expect(page).to have_content('Add a volunteer')
    fill_in('first_name', :with => 'Ilene')
    fill_in('last_name', :with => 'Gorski')
    click_button('Submit')
    expect(page).to have_content('Ilene Gorski')
    click_link('Go Home')
    expect(page).to have_content('What would you like to do?')
  end
  it "routes to an individual volunteer's page and allows an update or delete" do
    visit('/volunteers')
    click_button('Add a volunteer')
    fill_in('first_name', :with => 'Ilene')
    fill_in('last_name', :with => 'Gorski')
    click_button('Submit')
    click_link('Ilene Gorski')
    expect(page).to have_content('Volunteer: Ilene Gorski')
    click_button('Update volunteer information')
    fill_in('first_name', :with => 'Eileen')
    fill_in('last_name', :with => 'Gorski')
    click_button('Submit')
    expect(page).to have_content('Volunteer: Eileen Gorski')
    click_button('Delete this Volunteer')
    expect(page).to have_content('You do not have any volunteers yet.')
  end
end
