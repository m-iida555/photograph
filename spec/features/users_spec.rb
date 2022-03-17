require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "ユーザー登録ページ" do
    background do
      visit signup_path
    end

    context "ページレイアウト" do
      scenario "「ユーザー登録」の文字列が存在することを確認" do
        expect(page).to have_content '新規登録'
      end

      scenario "正しいタイトルが表示されることを確認" do
        expect(page).to have_title "新規登録 - SCENES撮影会"
      end
    end

    context "ユーザー登録" do
      scenario "ユーザー登録が完了した時、完了のメッセージが表示される。" do
        fill_in "ユーザー名", with: "撮影者"
        fill_in "メールアドレス", with: "example@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード(確認)", with: "password"
        click_on "登録する"
        expect(page).to have_content "登録が完了しました！"
      end

      scenario "ユーザー登録が失敗した時、エラーメッセージが出る。" do
        fill_in "ユーザー名", with: ""
        fill_in "メールアドレス", with: "example@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード(確認)", with: "password"
        click_on "登録する"
        expect(page).to have_content "を入力してください"
      end
    end
  end

  describe "プロフィール" do
    let!(:user) { create(:user, name: "撮影者", email: "sample@sample.com", id: 1) }

    background do
      visit user_path(1)
    end

    scenario "タイトルがただしく表示される" do
      expect(page).to have_title "撮影者情報 - SCENES撮影会"
    end

    scenario "コンテンツが正しく表示されている" do
      expect(page).to have_content user.name
      expect(page).to have_content user.email
      expect(page).to have_content user.id
    end
  end
end
