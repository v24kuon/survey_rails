require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '有効な属性の場合は有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'メールアドレスがない場合は無効であること' do
      user = build(:user, email: nil)
      expect(user).to be_invalid
    end

    it '重複したメールアドレスの場合は無効であること' do
      create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')
      expect(user).to be_invalid
    end

    it 'パスワードがない場合は無効であること' do
      user = build(:user, password: nil)
      expect(user).to be_invalid
    end

    it 'パスワードが6文字未満の場合は無効であること' do
      user = build(:user, password: '12345', password_confirmation: '12345')
      expect(user).to be_invalid
    end

    it '会社名がない場合は無効であること' do
      user = build(:user, company_name: nil)
      expect(user).to be_invalid
    end

    it 'ブース名がない場合は無効であること' do
      user = build(:user, booth_name: nil)
      expect(user).to be_invalid
    end

    it '氏名がない場合は無効であること' do
      user = build(:user, full_name: nil)
      expect(user).to be_invalid
    end

    it '電話番号がない場合は無効であること' do
      user = build(:user, phone: nil)
      expect(user).to be_invalid
    end

    it '郵便番号がない場合は無効であること' do
      user = build(:user, postal_code: nil)
      expect(user).to be_invalid
    end

    it '住所がない場合は無効であること' do
      user = build(:user, address: nil)
      expect(user).to be_invalid
    end
  end

  describe 'Deviseのメソッド' do
    it 'データベース認証可能であること' do
      user = create(:user)
      expect(user).to respond_to(:valid_password?)
    end

    it 'パスワードをリセット可能であること' do
      user = create(:user)
      expect(user).to respond_to(:reset_password_token)
    end

    it 'ログイン情報を記憶可能であること' do
      user = create(:user)
      expect(user).to respond_to(:remember_created_at)
    end
  end
end
