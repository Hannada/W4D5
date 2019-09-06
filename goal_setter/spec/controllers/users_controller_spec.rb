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
      before :each do 
        create(:user)
        allow(subject).to receive(:current_user).and_return(User.last) 
      end

      let(:valid_params) { { user: {username: 'Hannada', password: 'bigbird'}}}
      let(:invalid_params) { { user: {username: 'CookieMonster', password: '123'}}}

      context 'with valid params' do 
        it 'creates the user' do 
          post(:create, params: valid_params)
          expect(User.last.username).to eq('Hannada')
        end
      end

      context 'with invalid params' do 
        before :each do 
          post(:create, params: invalid_params) 
        end 

        it 'renders the new form' do 
          expect(response).to render_template(:new)
        end

        it 'adds errors to flash' do 
          expect(flash[:errors]).to be_present 
        end

      end
    
  end 












end