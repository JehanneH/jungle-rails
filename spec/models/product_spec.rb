require 'rails_helper'

RSpec.describe Product, type: :model do
  test_category = Category.find_or_create_by! name: 'Electronics'

  subject {
    described_class.new(name: 'test_name',
                        price: 3000,
                        quantity: 3,
                        category: test_category)
  }

  describe 'Validations' do
    # validates :name, presence: true
    it "product is not valid without name and error message is correct" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end

    # validates :price, presence: true
    it "product is not valid without price and error message is correct" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end
    
    # validates :quantity, presence: true
    it "product is not valid without quantity and error message is correct" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end

    # validates :category, presence: true
    it "product is not valid without category and error message is correct" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Category can't be blank"
    end
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end
end



