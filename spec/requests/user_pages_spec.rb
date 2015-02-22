require 'rails_helper'

describe 'user pages' do 
  subject { page }

  describe 'index' do 
    User.destroy_all
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    before { visit users_path }

    it { should have_title('All Users') }
    it { should have_selector('h1', 'All Users')}

    it 'lists each user' do 
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.id)
      end
    end

    describe 'delete links' do 
      let!(:user1) { FactoryGirl.create(:user) }
      let!(:user2) { FactoryGirl.create(:user) }
      let!(:admin) { FactoryGirl.create(:admin) }

      before do 
        sign_in admin
        visit users_path        
      end

      it { should have_link('delete', match: :first) }

      describe 'after clicking delete' do 
        before { click_link('delete', match: :first) }

        it { should_not have_content(user1.email) }
      end
    end

    describe 'show' do 
      let(:user) { FactoryGirl.create(:user) }

      before { visit user_path(user.id) }

      it { should have_title('Favorites') }
      it { should have_selector('h3', 'No favorites added yet.') }
    end

    describe 'new user page' do 
      before { visit root_path }

      it { should have_title('Welcome') }
      it { should have_selector('h3', 'Follow') }
    
      describe 'create user' do
        let(:submit) { 'Submit' }

        context 'valid information' do
          before do
            fill_in 'Email',            with: 'bryan.lackey@gmail.com'
            fill_in 'Password',         with: 'foobar'
            fill_in 'Confirm Password', with: 'foobar'
          end

          it 'creates user' do 
            expect { click_button submit }.to change(User, :count).by(1)
          end

          describe 'after saving' do 
            before { click_button submit }

            it { should have_title('Favorites') }
          end
        end

        context 'invalid information' do 
          it 'does not create user' do 
            expect { click_button submit }.not_to change(User, :count)
          end

          describe 'after submission' do 
            before { click_button submit }

            it { should have_title 'Welcome' }
            it { should have_content('error') }
          end
        end
      end  
    end

    describe 'edit user page' do 
      let(:user_for_edit) { FactoryGirl.create(:user) }

      before do 
        sign_in user_for_edit
        visit edit_user_path(user_for_edit.id)
      end

      it { should have_title('Edit Profile') }
      it { should have_selector( 'h3', 'Edit Profile') }

      describe 'update user' do 
        let(:submit) { 'Submit' }

        context 'valid information' do 
          before do 
            fill_in 'Email', with: 'b.lackey@gmail.com'
            click_button submit
          end

          describe 'after saving changes' do 
            it { should have_title('Favorites') }

            specify{ expect(user_for_edit.reload.email).to eq('b.lackey@gmail.com') }
          end
        end

        context 'invalid information' do 
          before do 
            fill_in 'Email', with: ''
            click_button submit
          end

          describe 'after submission' do 
            it { should have_title('Edit Profile') }

            it { should have_content('error') }
          end
        end
      end
    end
  end
end




