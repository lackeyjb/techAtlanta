require 'rails_helper'

describe FavoritesController, type: :controller do 

  describe 'POST #create' do 
    let(:user) { FactoryGirl.create(:user, id: 1) }
    let(:article) {FactoryGirl.create(:article, id: 1) }
    before { sign_in user, no_capybara: true }

    it 'creates new favorite' do 
      expect{
        post :create,  favorite: FactoryGirl.attributes_for(:favorite, article_id: article.id)
        }.to change(Favorite, :count).by(1)
          
    end
  end
end