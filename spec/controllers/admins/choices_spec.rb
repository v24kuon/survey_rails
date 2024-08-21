require 'rails_helper'

RSpec.describe Admins::ChoicesController, type: :request do
  let(:admin) { create(:admin) }
  let!(:survey) { create(:survey) }

  before do
    sign_in admin
  end

  describe 'POST #create' do
    it 'HTTPステータス200を返すこと' do
      post admins_choice_path(0), xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'Turbo Streamレスポンスを返すこと' do
      post admins_choice_path(0), xhr: true
      expect(response.media_type).to eq Mime[:turbo_stream]
    end

    it '新しい選択肢フォームを含むこと' do
      post admins_choice_path(0), xhr: true
      expect(response.body).to include('choice_text')
      expect(response.body).to include('order_number')
    end
  end

  describe 'DELETE #destroy' do
    it 'HTTPステータス200を返すこと' do
      delete admins_choice_path(0), xhr: true
      expect(response).to have_http_status(:success)
    end

    it '選択肢の削除フォームを含むこと' do
      delete admins_choice_path(0), xhr: true
      expect(response.body).to include('_destroy')
      expect(response.body).to include('hidden')
    end
  end
end
