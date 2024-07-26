require 'rails_helper'

RSpec.describe "Admins::Sessions", type: :request do
  let(:admin) { create(:admin) }

  describe 'GET /admins/sign_in' do
    it '正常なレスポンスを返すこと' do
      get new_admin_session_path
      expect(response).to have_http_status(200)
    end

    it 'ログインフォームを表示すること' do
      get new_admin_session_path
      expect(response.body).to include('<form', 'action="/admins/sign_in"')
      expect(response.body).to include('input', 'type="email"', 'name="admin[email]"')
      expect(response.body).to include('input', 'type="password"', 'name="admin[password]"')
    end
  end

  describe 'POST /admins/sign_in' do
    context '有効な認証情報の場合' do
      it '管理者がサインインできること' do
        post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
        expect(response).to redirect_to(admins_surveys_path)
        expect(controller.current_admin).to eq(admin)
      end
    end
    context '無効な認証情報の場合' do
      it '管理者がサインインできないこと' do
        post admin_session_path, params: { admin: { email: admin.email, password: 'wrongpassword' } }
        expect(response).to have_http_status(422) # ログインページを再表示
        expect(controller.current_admin).to be_nil
      end
    end
  end

  describe 'DELETE /admins/sign_out' do
    it '管理者がサインアウトできること' do
      sign_in admin
      delete destroy_admin_session_path
      expect(response).to redirect_to(root_path) # または適切なリダイレクト先
      expect(controller.current_admin).to be_nil
    end
  end
end
