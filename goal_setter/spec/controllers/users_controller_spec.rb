require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

  describe 'GET #new' do 
    it 'sends user to sign up form' do
      allow(subject).to receive(:logged_in?).and_return(true)

      get(:new)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do 
    it 'creates the user' do 
      before :each do 
        create(:user)
        allow(subject).to receive(:current_user).and_return(User.last) 











end