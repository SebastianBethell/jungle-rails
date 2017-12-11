require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

      it 'should create a new user if given all five required fields' do
        @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
        expect(@user).to be_valid
      end

      it 'should not be valid if the user\'s email is not unique, case insensitive' do
        @email1 = 'EMAIL@email.com'
        @email2 = 'email@email.com'
        @user1 = User.create!(first_name: 'Billy', last_name: 'Bob', email: @email2, password: 'qweqwe', password_confirmation: 'qweqwe')
        @user2 = User.new(first_name: 'Joey', last_name: 'FromFriends', email: @email1, password: 'qwerqwer', password_confirmation: 'qwerqwer')
        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'should not be valid if first_name is missing' do
        @user = User.new(first_name: nil, last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('First name can\'t be blank')
      end

      it 'should not be valid if last_name is missing' do
        @user = User.new(first_name: 'Billy', last_name: nil, email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Last name can\'t be blank')
      end

      it 'should not be valid if email is missing' do
        @user = User.new(first_name: 'Billy', last_name: 'Bob', email: nil, password: 'qweqwe', password_confirmation: 'qweqwe')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Email can\'t be blank')
      end

      it 'should not be valid if password_confirmation is missing' do
        @user = User.new(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: nil)
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password confirmation is too short (minimum is 6 characters)')
      end

      it 'should not be valid if password is missing' do
        @user = User.new(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: nil, password_confirmation: 'qweqwe')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'should not be valid if password is less than 6 chars' do
        @user = User.new(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qwe', password_confirmation: 'qwe')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'should not be valid if password != password_confirmation' do
        @user = User.new(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qwfqwf')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      end

  end

  describe '.authenticate_with_credentials' do

    it 'should take in email and pass, authenticate the user, return instance of the user' do
      @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
      @user2 = User.authenticate_with_credentials('email@email.com', 'qweqwe')
      expect(@user2).to be == @user
    end

    it 'should return nil if there isn\'t a user with that email' do
      @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
      @user2 = User.authenticate_with_credentials('emails@email.com', 'qweqwe')
      expect(@user2).to be nil
    end

    it 'should return nil if the password does not match the users password' do
      @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
      @user2 = User.authenticate_with_credentials('email@email.com', 'qweqwewqwq')
      expect(@user2).to be nil
    end

    it 'should return an instance of the user even if the email has empty spaces before or after itself' do
      @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
      @user2 = User.authenticate_with_credentials('     email@email.com', 'qweqwe')
      expect(@user2).to be == @user
    end

    it 'should return an instance of the user even if the email\'s case is different than the during registration' do
      @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
      @user2 = User.authenticate_with_credentials('eMaIl@eMAil.com', 'qweqwe')
      expect(@user2).to be == @user
    end

  end

end