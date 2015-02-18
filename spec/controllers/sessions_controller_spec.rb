require 'rails_helper'

describe SessionsController, type: :controller do 
  describe 'GET #new' do 
    it 'renders new' do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do 
    let(:user) { FactoryGirl.create(:user) }

    context 'valid information' do 
      it 'signs in user' do 
        post :create, session: { email: user.email, password: user.password }
        expect(controller).to be_signed_in
      end

      it "redirects to a user's profile" do 
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to(articles_path)
      end
    end

    context 'invalid information' do 
      it 'does not sign in user' do 
        post :create, session: { email: 'okay' }
        expect(controller).to_not be_signed_in
      end

      it 're-renders new' do 
        post :create, session: { email: 'okay' }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do 
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in(user, no_capybara: true) }

    it 'destroys requested session' do 
      delete :destroy
      expect(controller).to_not be_signed_in
    end

    it 'redirects to home' do
      delete :destroy
      expect(controller).to redirect_to(root_url)
    end
  end
end