require 'rails_helper'

describe ArticlesController, type: :controller do 
  let(:article1) { FactoryGirl.create(:article) }
  let(:article2) { FactoryGirl.create(:article) }

  describe 'GET #index' do 
    it 'renders index' do 
      get :index
      expect(response).to render_template(:index)
    end
  end
end