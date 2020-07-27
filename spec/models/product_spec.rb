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
    it "product is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

   
    
  end
end


# validates :quantity, presence: true
# validates :category, presence: true