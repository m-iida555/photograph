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
    delete signout_path
    follow_redirect!
  end

  it "無効なユーザーではログインできない事のテスト" do
    get signin_path
    post signin_path, params: { session: { email: "wrong@sample.com", password: user.password } }
    expect(is_logged_in?).not_to be_truthy
  end

  context "ログインしたままのボックスにチェックを入れてログインする場合をテスト" do
    before do
      signin_remember(user)
    end

    it "remember_tokenが空ではない事を確認" do
      expect(response.cookies['remember_token']).not_to eq nil
    end

    it "セッションがnilの時でもcurrent_userが正しいユーザーを指す事を確認" do
      expect(current_user).to eq user
      expect(is_logged_in?).to be_truthy
    end

    context "ログインしたままのボックスにチェックを入れないでログインする場合をテスト" do
      it "remember_tokenが空である事を確認" do
        signin_remember(user)
        delete signout_path
        post signin_path, params: { session: { email: user.email,
                                               password: user.password,
                                               remember_me: '' } }
      expect(response.cookies['remember_token']).to eq nil
      end
    end
  end

  context "ログアウトする場合をテスト" do
    it "ログイン中のみログアウトする事をテスト" do
      signin_for_request(user)
      expect(response).to redirect_to user_path(user)
      delete signout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
      delete signout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
    end
  end
end
