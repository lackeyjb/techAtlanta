require 'rails_helper'

describe User do 
  let(:user) { User.new(email: 'nacho_taco@gmail.com',
                        ) }

  subject { user }

  it { should respond_to(:email) }

  describe 'validations' do 
    describe 'email' do 
      context 'not present' do 
        it 'is invalid' do 
          user.email = ''
          expect(user).to_not be_valid
        end
      end

      context 'too long' do 
        it 'is invalid' do 
          user.email = 'a' * 255
          expect(user).to_not be_valid
        end
      end

      context 'valid format' do 
        it 'is valid' do 
          valid_addresses = %w{ user@foo.COM A_US-ER@f.b.org
                                first.last@foo.jp a+b@baz.cn a@b.co }
          valid_addresses.each do |address|
            user.email = address
            expect(user).to be_valid
          end
        end
      end

      context 'invalid format' do 
        it 'is invalid' do 
          invalid_addresses = %w{ user@foo,com user_at_foo.org example.user@foo.
                                  foo@bar_baz.com foo@bar+baz.com foo@bar..com }
          invalid_addresses.each do |address|
            user.email = address
            expect(user).to_not be_valid
          end
        end
      end

      context 'not unique' do 
        before do 
          user_with_same_email = user.dup
          user_with_same_email.save

          it { should_not be_valid }
        end
      end

      context 'mixed case' do 
        it 'is saved as lowercase' do 
          mixed_case_email = 'NACHO_Taco@gmail.cOM'
          user.email = mixed_case_email
          user.save

          expect(user.reload.email).to eq(mixed_case_email.downcase)
        end
      end
    end
  end
end
