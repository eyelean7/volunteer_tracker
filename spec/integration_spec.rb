require('capybara/rspec')
require('./app')
require('pry')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('projects', {:type => :feature}) do
  it "goes to projects page and adds a project when the form is submitted" do
    visit('/')
    click_link('Go to projects page')
    expect(page).to have_content('Add a project')
    click_button('Add a project')
    fill_in('name', :with => 'Feed the Children')
    click_button('Submit')
    expect(page).to have_content('Feed the Children')
  end
  it "goes to the volunteers page when its button is clicked" do
    visit('/')
    click_link('Go to volunteers page')
    expect(page).to have_content('Add a volunteer')
  end

end
