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

      it "is invalid because it doesn't match password and password_confirmation" do
        user = build(:user, password_confirmation: 12345678)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      
    end
  end
end
