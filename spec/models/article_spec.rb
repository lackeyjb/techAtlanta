require 'rails_helper'

describe Article do 
  let(:article) { FactoryGirl.create(:article) }

  it { should respond_to(:summary) }
  it { should respond_to(:source) }
end
