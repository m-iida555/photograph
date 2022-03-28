require 'rails_helper'

RSpec.describe "サインイン", type: :request do
  let(:user) { create(:user) }

  it "正常なレスポンスが返ってくる" do
    get signin_path
    expect(response).to have_http_status "200"
  end

  it "有効なユーザーでサインインとサインアウトができる事を確認" do
    get signin_path
    post signin_path, params: { session: { email: user.email, password: user.password } }

    redirect_to user_path(user.id)
    follow_redirect!
    expect(response).to render_template('users/show')
    expect(is_logged_in?).to be_truthy
    delete signout_path
    expect(is_logged_in?).not_to be_truthy
    redirect_to root_path
  end

  it "無効なユーザーではログインできない事のテスト" do
    get signin_path
    post signin_path, params: { session: { email: "wrong@sample.com", password: user.password } }
    expect(is_logged_in?).not_to be_truthy
  end
end
