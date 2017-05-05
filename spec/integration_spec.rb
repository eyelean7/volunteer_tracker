require('capybara/rspec')
require('./app')
require('pry')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('projects', {:type => :feature}) do
  it "goes to the projects page when its button is clicked" do
    visit('/')
    click_link("Go to projects page")
    expect(page).to have_content('Add a project')
  end
  it "goes to the volunteers page when its button is clicked" do
    visit('/')
    click_link("Go to volunteers page")
    expect(page).to have_content('Add a volunteer')
  end

end
