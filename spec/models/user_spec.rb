require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should pass' do
      @user = User.new(
        first_name: 'Gabe', 
        last_name: 'Pozo', 
        email: 'abc@123.com', 
        password: '123456789', 
        password_confirmation: '123456789')
      expect(@user).to be_valid  
    end

    it 'should not pass when passwords dont match' do
      @user = User.new(
        first_name: 'Gabe', 
        last_name: 'Pozo', 
        email: 'gabe@pozo.com', 
        password: '123', 
        password_confirmation: '1234')
      expect(@user).to_not be_valid  
    end

    it 'should not pass when emails are not unique' do
      @user1 = User.new(
        first_name: 'Gabe', 
        last_name: 'Pozo', 
        email: 'ken@me.com', 
        password: '123456', 
        password_confirmation: '123456')

      @user2 = User.new(
        first_name: 'Gabe', 
        last_name: 'Pozo', 
        email: 'ken@ME.com', 
        password: '123456', 
        password_confirmation: '123456')

      @user1.save!
      expect(@user2).to_not be_valid  
    end

    it 'should not pass when password length is not met' do
      @user = User.new(
        first_name: 'Gabe', 
        last_name: 'Pozo', 
        email: 'gabe@pozo.com', 
        password: '123', 
        password_confirmation: '123')
      expect(@user).to_not be_valid  
    end

    it 'should not pass with no email' do
      @user = User.new(
        first_name: 'Gabe', 
        last_name: 'Pozo', 
        email: nil, 
        password: '123', 
        password_confirmation: '123')
      expect(@user).to_not be_valid  
    end

    it 'should not pass with no first name' do
      @user = User.new(
        first_name: nil, 
        last_name: 'Pozo', 
        email: 'gabe@pozo.com', 
        password: '123', 
        password_confirmation: '123')
      expect(@user).to_not be_valid  
    end

    it 'should not pass with no last name' do
      @user = User.new(
        first_name: 'Gabe', 
        last_name: '', 
        email: 'gabe@pozo.com', 
        password: '123', 
        password_confirmation: '123')
      expect(@user).to_not be_valid  
    end

    describe '.authenticate_with_credentials' do
      
      it 'should pass correctly' do
      @user = User.create!(
        first_name: 'Yves', 
        last_name: 'Middleton', 
        email: 'yves@great.com', 
        password: 'gabrielisgreat', 
        password_confirmation: 'gabrielisgreat')  
    
        expect(@user.authenticate_with_credentials(@user.email, @user.password)).to_not eql(nil)
      end

      it 'should pass correctly with white spaces' do
      @user = User.create!(
        first_name: 'Yves', 
        last_name: 'Middleton', 
        email: 'yves@great.com', 
        password: 'gabrielisgreat', 
        password_confirmation: 'gabrielisgreat')  
    
        expect(@user.authenticate_with_credentials('   yves@great.com', @user.password)).to_not eql(nil)
      end

      it 'should pass correctly' do
      @user = User.create!(
        first_name: 'Yves', 
        last_name: 'Middleton', 
        email: 'yves@great.com', 
        password: 'gabrielisgreat', 
        password_confirmation: 'gabrielisgreat')  
    
        expect(@user.authenticate_with_credentials('YVEs@gReat.com', @user.password)).to_not eql(nil)
      end
    end

  end
end