require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do 
    create(:user)
    create_user(User.last)
  end
  
  scenario 'has a new user page' do   
    visit new_user_url 
    expect(page).to have_content ('new user alert!') 
  end
  
  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup'

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end