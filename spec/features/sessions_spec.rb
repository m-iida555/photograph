require 'rails_helper'

RSpec.feature "サインイン", type: :feature do
  let(:user) { create(:user) }

  background do
    visit signin_path
  end

  describe "サインイン" do
    scenario "サインインページが表示されていることを確認" do
      expect(page).to have_content "サインイン"
    end

    scenario "正しいタイトルが表示されることを確認" do
      expect(page).to have_title "サインイン - SCENES撮影会"
    end

    scenario "サインイン項目があることを確認" do
      expect(page).to have_content "メールアドレス"
      expect(page).to have_content "パスワード"
    end

    it "サインインにしたままにするボックスが表示されることを確認" do
      expect(page).to have_content "ログイン状態を保持する"
      expect(page).to have_css "input#session_remember_me"
    end

    scenario "サインインボタンがある事を確認" do
      expect(page).to have_button "サインイン"
    end

    context "サインイン処理" do
      scenario "無効なユーザーでのログインができない事をテスト" do
        fill_in "user_email", with: "123"
        fill_in "user_password", with: "password"
        click_link "サインイン"
        expect(page).not_to have_content "メールアドレスとパスワードの組み合わせが間違っております。"

        visit root_path
        expect(page).not_to have_content "メールアドレスとパスワードの組み合わせが間違っております。"
      end

      scenario "有効なユーザーでログインするとヘッダーが変化する事をテスト" do
        expect(page).to have_link "サインイン", href: signin_path
        expect(page).to have_link "新規登録する", href: signup_path
        expect(page).to have_content "メールアドレス"

        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        click_button "サインイン"

        expect(page).to have_selector "img[alt='profile-image']"
        expect(page).to have_content "撮影者様情報"
      end
    end
  end
end
