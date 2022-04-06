require "rails_helper"

RSpec.describe "お客様情報の編集", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user, name: "other", email: "other@gmail.com") }

  context "ログインしたユーザーの場合" do
    it "レスポンスが正常に表示される事とフレンドフォワーディング" do
      get edit_user_path(user)
      signin_for_request(user)
      expect(response).to redirect_to edit_user_url(user)
      patch user_path(user), params: { user: { name: "Example",
                                               email: "sample@gmail.com",
                                               address: "N県",
                                               birth_date: "1988-12-31" } }
      redirect_to user
      follow_redirect!
      expect(response).to render_template('users/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトする事" do
      get edit_user_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to signin_path
      patch user_path(user), params: { user: { name: user.name,
                                               email: user.email } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to signin_path
    end
  end

  context "別のアカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトされる事" do
      signin_for_request(other_user)
      get edit_user_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      patch user_path(user), params: { user: { name: user.name,
                                               email: user.email } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end
