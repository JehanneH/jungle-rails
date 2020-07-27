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

    it ""

  end
end
