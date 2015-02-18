require 'rails_helper'

describe UsersController, type: :controller do 

  describe 'GET #new' do 
    it 'renders new' do 
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new user' do 
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
end