require('capybara/rspec')
require('header_spec')
require('./app')
Capybara.app = Sinatra::Application

describe('salon management app') do

  describe('index get', {:type => :feature}) do
    it('Displays index page') do
      visit('/')
      expect(page).to have_content('Salon')
    end
  end

describe('add a stylist path', {:type => :feature}) do
  it('clicks through the index to the stylist page, fills in form, and displays result') do
    visit('/')
    click_link('Manage Stylists')
    expect(page).to have_content('Stylist')
    fill_in("name", {:with => "John"})
    click_button("Add stylist")
    expect(page).to have_content("John")
    click_link("See Clients")
    expect(page).to have_content("Client Management")
    fill_in("name", {:with => "Jessie"})
    click_button("Add client")
    expect(page).to have_content("Jessie")
    click_link('See Stylists')
    click_link('John')
    expect(page).to have_content("John")
    check('client_ids[]')
    click_button("Add clients")
    expect(page).to have_content("Here are all the clients")
  end
end

describe('add a client path', {:type => :feature}) do
  it('clicks through the index to the client page, fills in form, displays result, adds stylist') do
    visit('/')
    click_link('Manage Clients')
    expect(page).to have_content('Client')
    fill_in("name", {:with => "Jake"})
    click_button("Add client")
    expect(page).to have_content("Jake")
    click_link('See Stylists')
    fill_in("name", {:with => "John"})
    click_button("Add stylist")
    click_link('See Clients')
    click_link("Jake")
    expect(page).to have_content("Jake")
    select("John", :from => "stylist_id")
    click_button("Add stylist")
    expect(page).to have_content("This client's stylist")
  end
end

#
# describe('seeing details for a single list', {:type => :feature}) do
#   it('allows a user to click a list to see the tasks and details for it') do
#     test_list = List.new({:name => 'School stuff'})
#     test_list.save()
#     test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
#     test_task.save()
#     visit('/lists')
#     click_link(test_list.name())
#     expect(page).to have_content(test_task.description())
#   end
# end
#
# describe('adding tasks to a list', {:type => :feature}) do
#   it('allows a user to add a task to a list') do
#     test_list = List.new({:name => 'School stuff'})
#     test_list.save()
#     visit("/lists/#{test_list.id()}")
#     fill_in("Description", {:with => "Learn SQL"})
#     click_button("Add task")
#     expect(page).to have_content("Success")
#   end
# end
#
end
