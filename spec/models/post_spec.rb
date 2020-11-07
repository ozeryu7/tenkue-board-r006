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
      it "is invalid without a content" do
        post = build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end

      it "is invalid with a content that has more than 140 characters " do
        post = build(:post)
        post.content = Faker::Lorem.characters(number:200)
        post.valid?
        expect(post.errors[:content]).to include("は140文字以内で入力してください")
      end

      it "is invalid without a user_id " do
        post = build(:post, user_id: nil)
        post.valid?
        expect(post).to be_invalid
      end
    end
  end
end

