require "rails_helper"

RSpec.describe "ユーザー登録", type: :request do
  describe "ユーザー登録に関する動作" do
    before do
      get signup_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status "200"
    end

    it "有効なユーザーで登録できる事をテスト" do
      expect {
        post users_path, params: { user: { name: "Example User",
                                           email: "user@example.com",
                                           password: "password",
                                           password_confirmation: "password" } }
      }.to change(User, :count).by(1)
    end

    it "無効なユーザーでは登録できないことをテスト" do
      expect {
        post users_path, params: { user: { name: "",
                                           email: "user@example.com",
                                           password: "password",
                                           password_confirmation: "wrong" } }
      }.not_to change(User, :count)
    end
  end
end
