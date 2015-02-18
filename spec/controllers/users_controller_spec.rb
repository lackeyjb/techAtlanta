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

  describe 'POST #create' do 
    context 'valid attributes' do 
      it 'creates new user' do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1) 
      end

      it 'redirects to users#show' do 
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(user_path(User.last.id))
      end
    end

    context 'invalid attributes' do 
      let(:invalid_attributes) { { name: '' } }

      it 'does not create new user' do 
        expect{
          post :create, user: invalid_attributes
        }.to_not change(User, :count)
      end

      it 're-renders new' do 
        post :create, user: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do 
    let(:user) { FactoryGirl.create(:user) }

    it 'renders show' do 
      get :show, id: user.id 
      expect(response).to render_template(:show)
    end

    it 'assigns correct user' do 
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #index' do 
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    it 'renders index' do 
      get :index
      expect(response).to render_template(:index)
    end

    it 'populates an array of users' do 
      get :index
      expect(assigns(:users)).to eq([user1, user2])
    end
  end

  describe 'GET #edit' do 
    let(:user_for_edit) { FactoryGirl.create(:user) }

    before { sign_in user_for_edit, no_capybara: true }

    it 'renders edit' do 
      get :edit, id: user_for_edit.id 
      expect(response).to render_template(:edit)
    end

    it 'assigns correct user' do 
      get :edit, id: user_for_edit.id 
      expect(assigns(:user)).to eq(user_for_edit)
    end
  end

  describe 'PATCH #update' do 
    let(:user_for_edit) { FactoryGirl.create(:user, email: 'pizza_spaghetti@gorgonzola.org') }

    before{ sign_in user_for_edit, no_capybara: true }

    context 'valid attributes' do 
      it 'updates user' do 
        patch :update, id: user_for_edit.id, user: { email: 'taco_nacho@jalapeno.edu' }
        user_for_edit.reload
        expect(user_for_edit.email).to eq('taco_nacho@jalapeno.edu')
      end

      it 'redirects to users#show' do 
        patch :update, id: user_for_edit.id, user: { email: 'taco_nacho@jalapeno.edu' }
        user_for_edit.reload
        expect(response).to redirect_to(user_path(user_for_edit.id))
      end
    end

    context 'invalid attributes' do 
      it 'does not update user' do 
        patch :update, id: user_for_edit.id, user: { email: '' }
        user_for_edit.reload
        expect(user_for_edit.email).to eq('pizza_spaghetti@gorgonzola.org')
      end

      it 're-renders edit' do 
        patch :update, id: user_for_edit.id, user: { email: '' }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do 

    it 'redirects to index' do 
      user_for_removal = FactoryGirl.create(:user)
      sign_in user_for_removal, no_capybara: true

      delete :destroy, id: user_for_removal.id
      expect(response).to redirect_to(user_path)
    end
  end
end












