require 'rails_helper'

RSpec.describe "Admins::Users", type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe 'GET #index' do
    context '管理者としてログインしている場合' do
      before { sign_in admin }

      it 'ステータスコード200を返すこと' do
        get admins_users_path
        expect(response).to have_http_status(:ok)
      end

      it 'ユーザー一覧ページの内容を含むこと' do
        get admins_users_path
        expect(response.body).to include('メールアドレス')
        expect(response.body).to include('登録日')
      end

      it 'ユーザー一覧を取得すること' do
        users = create_list(:user, 3)
        get admins_users_path
        users.each do |user|
          expect(response.body).to include(user.email)
          expect(response.body).to include(user.created_at.strftime('%Y/%m/%d %H:%M'))
        end
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページにリダイレクトされること' do
        get admins_users_path
        expect(response).to redirect_to(new_admin_session_path)
      end

      it 'アラートメッセージが表示されること' do
        get admins_users_path
        expect(flash[:alert]).to eq 'ログインもしくはアカウント登録してください。'
      end
    end
  end
end
