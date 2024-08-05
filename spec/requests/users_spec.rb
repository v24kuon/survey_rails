require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #show' do
    context 'ユーザー自身の場合' do
      before { sign_in user }

      it 'ステータスコード200を返すこと' do
        get user_path(user)
        expect(response).to have_http_status(:ok)
      end

      it 'ユーザー情報を表示すること' do
        get user_path(user)
        expect(response.body).to include(user.email)
      end
    end

    context '他のユーザーの場合' do
      before { sign_in user }

      it 'rootにリダイレクトされること' do
        get user_path(other_user)
        expect(response).to redirect_to(root_path)
      end

      it 'アラートメッセージが表示されること' do
        get user_path(other_user)
        expect(flash[:alert]).to eq 'アクセス権限がありません。'
      end
    end

    context 'ログインしていない場合' do
      it 'rootにリダイレクトされること' do
        get user_path(user)
        expect(response).to redirect_to(root_path)
      end

      it 'アラートメッセージが表示されること' do
        get user_path(user)
        expect(flash[:alert]).to eq 'アクセス権限がありません。'
      end
    end
  end
end
