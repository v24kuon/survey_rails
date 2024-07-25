require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create(:admin) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(admin).to be_valid
    end

    it 'is not valid without an email' do
      admin.email = nil
      expect(admin).to_not be_valid
    end

    it 'is not valid without a password' do
      admin.password = nil
      expect(admin).to_not be_valid
    end

    it 'is not valid with a short password' do
      admin.password = 'short'
      expect(admin).to_not be_valid
    end
  end

  describe 'devise modules' do
    it 'uses database_authenticatable module' do
      expect(Admin.devise_modules).to include(:database_authenticatable)
    end

    it 'uses rememberable module' do
      expect(Admin.devise_modules).to include(:rememberable)
    end

    it 'uses validatable module' do
      expect(Admin.devise_modules).to include(:validatable)
    end
  end
end
