require 'rails_helper'

RSpec.describe User do

  describe '#validation' do
    context 'can save' do
      it "is valid with a name, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
    context 'can not save' do
      it "is invalid without a name" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください", "は不正な値です", "は8文字以上で入力してください")
      end

      it "is invalid without a password_confirmation" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("を入力してください")
      end

      it "is invalid because it doesn't match password and password_confirmation" do
        user = build(:user, password_confirmation: "test1234")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      
      it "is valid with a password that has less than 32 characters " do
        user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:password][0]).to include("は32文字以内で入力してください")
      end

      it "is invalid with a duplicate email" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

    end
  end
end
