require 'rails_helper'

describe Favorite do 
  let(:favorite) { Favorite.create(user_id: 1, article_id: 2) }

  it { should respond_to(:user_id) }
  it { should respond_to(:article_id) }
end