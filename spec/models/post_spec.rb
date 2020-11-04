require 'rails_helper'

RSpec.describe Post do
  describe '#validation' do
    context 'can save' do
      it "is valid with a content, user_id" do
        post = build(:post)
        expect(post).to be_valid
      end
    
    end

    context 'can not save' do
    end
  end
end
