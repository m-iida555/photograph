require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "新規登録ページ" do
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

  describe "お客様情報ページ" do
    let!(:user) { create(:user, name: "撮影者", email: "sample@sample.com", id: 1) }

    background do
      signin_for_feature(user)
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

    scenario "お客様情報編集ページへのリンクが表示されている事を確認" do
      expect(page).to have_content "お客様情報の変更"
    end
  end

  describe "お客様情報の編集" do
    let!(:user) { create(:user, name: "撮影者", email: "sample@sample.com", id: 1) }

    background do
      signin_for_feature(user)
      visit user_path(1)
      click_link "お客様情報の変更"
    end

    scenario "正しいタイトルが表示されることのテスト" do
      expect(page).to have_title "お客様情報の編集"
    end

    scenario "有効な更新の場合、フラッシュメッセージとお客様情報が正しく表示される事を確認" do
      fill_in "ユーザー名", with: "Example"
      fill_in "メールアドレス", with: "a@gmail.com"
      select "2018", from: "user[birth_date(1i)]"
      select "12", from: "user[birth_date(2i)]"
      select "31", from: "user[birth_date(3i)]"
      fill_in "電話番号", with: "12312341234"
      fill_in "お住まいのご住所", with: "N県O市"
      click_button "更新する"
      expect(page).to have_content "お客様情報を更新しました。"
      expect(user.reload.name).to eq "Example"
      expect(user.reload.email).to eq "a@gmail.com"
      expect(user.birth_date).to have_content "2018-12-31"
      expect(user.reload.telephone).to eq 12312341234
      expect(user.reload.address).to eq "N県O市"
    end

    scenario "無効な更新の場合、エラーメッセージが表示される事を確認" do
      fill_in "ユーザー名", with: ""
      fill_in "メールアドレス", with: ""
      fill_in "電話番号", with: "123"
      click_button "更新する"
      expect(page).to have_content "ユーザー名を入力してください"
      expect(page).to have_content "メールアドレスを入力してください"
      expect(page).to have_content "電話番号は10文字以上で入力してください"
    end
  end

  describe "お客様情報の削除" do
    let!(:user) { create(:user, name: "撮影者", email: "sample@sample.com", id: 1) }

    background do
      signin_for_feature(user)
      visit user_path(1)
    end

    scenario "削除ボタンが表示される" do
      expect(page).to have_content "アカウントの削除"
      click_link "アカウントの削除"
      expect(page).to have_content "アカウントを削除しました。"
    end
  end
end
