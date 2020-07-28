require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Jehanne",
                        last_name: "Hodge",
                        email: "jh@email.com",
                        password: "password",
                        password_confirmation: "password")
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "validates that email, first name, last name, password, and password confirmation are present" do
      expect(subject.first_name).to be_present
      expect(subject.last_name).to be_present
      expect(subject.email).to be_present
      expect(subject.password).to be_present
      expect(subject.password_confirmation).to be_present
    end

    it "is not valid without first name and error message is correct" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "First name can't be blank"
    end
   
    it "is not valid without last name and error message is correct" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Last name can't be blank"
    end

    it "is not valid without email and error message is correct" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Email can't be blank"
    end

    it "is not valid without password and error message is correct" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password can't be blank"
    end

    it "is not valid without password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it "is not valid when the email is not unique (not case senstive)" do
      first_subject = User.new(
        first_name: "New", 
        last_name: "User", 
        email: "test@test.com", 
        password: "password", 
        password_confirmation: "password"
      )
      first_subject.save

      second_subject = User.new(
        first_name: "Another", 
        last_name: "Person", 
        email: "TEST@TEST.com", 
        password: "password", 
        password_confirmation: "password"
      )
      second_subject.save
      expect(second_subject).to_not be_valid
      expect(second_subject.errors.full_messages).to include "Email has already been taken"
    end

    it "is not valid if password length is too short (less than 3 characters)" do
      new_subject = User.new(
        first_name: "Another", 
        last_name: "Person", 
        email: "tes@test.com", 
        password: "no", 
        password_confirmation: "no"
      )
      new_subject.save
      expect(new_subject).to_not be_valid
      expect(new_subject.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end
    
    describe '.authenticate_with_credentials' do
      it "authenticates when email is correct but contains empty spaces on either side" do
       subject.save
       authenticate = User.authenticate_with_credentials(" " + subject.email + " ", subject.password)
       expect(authenticate).to eq subject
      end

      it "authenticates when email is correct but user has used wrong case" do
        subject.save
        authenticate = User.authenticate_with_credentials("JH@email.com", subject.password)
        expect(authenticate).to eq subject
       end
    end
  end
end
