require 'rails_helper'

describe 'article pages' do 
  subject { page }

  describe 'index' do 
    Article.destroy_all
    let(:article) { FactoryGirl.create(:article) }

    before { visit articles_path }

    
    it { should have_title('Latest Posts') }

    it 'lists each article' do 
      Article.all.each do |article|
        expect(page).to have_selector('p', text: article.summary)
      end
    end
  end
end