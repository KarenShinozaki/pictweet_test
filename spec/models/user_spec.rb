# frozen_string_literal: true

require 'rails_helper'
describe User do
  describe '#create' do
    it 'is good user-terms' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid without a password_confirmation' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid too long nickname' do
      user = build(:user, nickname: 'karenchan555555555')
      user.valid?
      expect(user.errors[:nickname]).to include('is too long (maximum is 6 characters)')
    end

    it 'is valid nickname under 6' do
      user = create(:user, nickname: 'yamada')
      user.valid?
      expect(true)
    end

    it 'is duplication e-mail' do
      user = create(:user)
      user.valid?
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'is valid password over 6' do
      user = create(:user, password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(true)
    end

    it 'is invalid password under 5' do
      user = build(:user, password: '00000', password_confirmation: '00000')
      user.valid?
      expect(user.errors[:password][0]).to include('is too short (minimum is 6 characters)')
    end
  end
end
