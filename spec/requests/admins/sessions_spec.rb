require 'rails_helper'

RSpec.describe "Admins::Sessions", type: :request do
  let(:admin) { create(:admin) }

  describe 'GET /admins/sign_in' do
    it 'returns a successful response' do
      get new_admin_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /admins/sign_in' do
    context 'with valid credentials' do
      it 'signs in the admin' do
        post admin_session_path, params: { admin: { email: admin.email, password: admin.password } }
        expect(response).to redirect_to(admins_surveys_path)
        expect(controller.current_admin).to eq(admin)
      end
    end
    context 'with invalid credentials' do
      it 'does not sign in the admin' do
        post admin_session_path, params: { admin: { email: admin.email, password: 'wrongpassword' } }
        expect(response).to have_http_status(422) # ログインページを再表示
        expect(controller.current_admin).to be_nil
      end
    end
  end

  describe 'DELETE /admins/sign_out' do
    it 'signs out the admin' do
      sign_in admin
      delete destroy_admin_session_path
      expect(response).to redirect_to(root_path) # または適切なリダイレクト先
      expect(controller.current_admin).to be_nil
    end
  end
end
