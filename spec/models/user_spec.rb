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

    
    end
  end
end
