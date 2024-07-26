require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create(:admin) }

  describe 'バリデーション' do
    it '有効な属性で作成された場合、有効であること' do
      expect(admin).to be_valid
    end

    it 'メールアドレスがない場合、無効であること' do
      admin.email = nil
      expect(admin).to_not be_valid
    end

    it 'パスワードがない場合、無効であること' do
      admin.password = nil
      expect(admin).to_not be_valid
    end

    it 'パスワードが短すぎる場合、無効であること' do
      admin.password = 'short'
      expect(admin).to_not be_valid
    end
  end

  describe 'Deviseモジュール' do
    it 'database_authenticatableモジュールを使用していること' do
      expect(Admin.devise_modules).to include(:database_authenticatable)
    end

    it 'rememberableモジュールを使用していること' do
      expect(Admin.devise_modules).to include(:rememberable)
    end

    it 'validatableモジュールを使用していること' do
      expect(Admin.devise_modules).to include(:validatable)
    end
  end
end
