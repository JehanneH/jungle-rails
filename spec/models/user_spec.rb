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

    it "it validates that email, first name, last name, password, and password confirmation are present" do
      expect(subject.first_name).to be_present
      expect(subject.last_name).to be_present
      expect(subject.email).to be_present
      expect(subject.password).to be_present
      expect(subject.password_confirmation).to be_present
    end

    it "user is not valid without first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      # puts subject.errors.full_messages
    end
   
    it "user is not valid without last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "user is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "user is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    
    it "user is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

  end
end
