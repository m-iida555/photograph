require "rails_helper"

RSpec.describe "ユーザーの削除", type: :request do
  let!(:user) { create(:user) }

  context "有効なユーザーの場合" do
    it "ユーザーを削除後、ユーザー一覧ページにリダイレクト" do
      signin_for_request(user)
      expect { delete user_path(user) }.to change(User, :count).by(-1)
      redirect_to root_path
      follow_redirect!
      expect(response).to render_template root_path
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログインページへリダイレクトすること" do
      expect { delete user_path(user) }.not_to change(User, :count)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to signin_path
    end
  end
end
