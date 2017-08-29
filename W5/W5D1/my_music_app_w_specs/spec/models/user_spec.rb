require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    subject(:user) do
      FactoryGirl.build(:user, email: "random123@aol.com", password: "password")
    end


    describe 'validations' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_length_of(:password).is_at_least(6) }

    end

    describe '#reset_session_token!' do
      it 'sets a new session token for user' do
        last_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(last_session_token)
      end
    end

    describe '#is_password?' do
      it 'returns true if the password matches the user\'s password' do
        expect(user.is_password?("password")).to be true
      end
    end

    describe '::find_by_credentials' do
      it 'returns the user if the provided information is correct' do
        expect(User.find_by_credentials("random123@aol.com", "password").to eq(user))
      end
    end
  end
end
