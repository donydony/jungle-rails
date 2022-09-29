require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'should be valid with correct attributes' do
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: "abc@gmail.com", password: "123456", password_confirmation: "123456"})

      @user.save!
      expect(@user).to_not be_nil
    end

    it 'should produce error with different passwords' do
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: "abc@gmail.com", password: "1234567", password_confirmation: "123456"})

      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should produce error with when trying to save a second user with the same email' do
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: "abc@gmail.com", password: "123456", password_confirmation: "123456"})

      @user.save!

      @user2 = User.new({first_name: "Donny", last_name: "Zhao", email: "abc@gmail.com", password: "123456", password_confirmation: "123456"})
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should produce error without first_name' do
      @user = User.new({first_name: nil, last_name: "Zhao", email: "abc@gmail.com", password: "123456", password_confirmation: "123456"})

      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should produce error without last_name' do
      @user = User.new({first_name: "Donny", last_name: nil, email: "abc@gmail.com", password: "123456", password_confirmation: "123456"})

      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should produce error without email' do
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: nil, password: "123456", password_confirmation: "123456"})

      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should produce error when password isn't at least 6 characters" do
      
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: "abc@gmail.com", password: "1234", password_confirmation: "1234"})

      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should be nil with non-existent email and password' do
      @user = User.authenticate_with_credentials("abc@gmail.com", "123456")
      
      expect(@user).to be_nil
    end

    it 'should authenticate with leading and/or trailing white spaces' do
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: "abc@gmail.com", password: "123456", password_confirmation: "123456"})

      @user.save!
      
      @user2 = User.authenticate_with_credentials("  abc@gmail.com  ", "123456")
      expect(@user2).to_not be_nil
    end

    it 'should authenticate without considering email case' do
      @user = User.new({first_name: "Donny", last_name: "Zhao", email: "aBc@gmail.com", password: "123456", password_confirmation: "123456"})

      @user.save!
      
      @user2 = User.authenticate_with_credentials("abC@gmAil.com", "123456")
      expect(@user2).to_not be_nil
    end
  end
end
