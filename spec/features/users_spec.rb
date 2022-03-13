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
        expect(page).to have_title ('新規登録 - SCENES撮影会')
      end
    end
  end
end
