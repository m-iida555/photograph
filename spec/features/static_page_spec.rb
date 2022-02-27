require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  describe "トップページ" do
    background do
      visit root_path
    end

    scenario "SCENES撮影会の文字が表示されているかどうか" do
      expect(page).to have_content "SCENES撮影会"
    end

    scenario "タイトルの文字が表示されているかどうか" do
      expect(page).to have_title full_title
    end
  end

  describe "ABOUT US" do
    background do
      visit about_path
    end

    scenario "ABOUT USの文字列が表示されているかどうか" do
      expect(page).to have_content "ABOUT US"
    end

    scenario "ABOUT USの文字が表示されているかどうか" do
      expect(page).to have_title full_title('ABOUT US')
    end
  end

  describe "利用規約" do
    background do
      visit use_of_terms_path
    end

    scenario "利用規約の文字列が表示されているかどうか" do
      expect(page).to have_content "利用規約"
    end

    scenario "利用規約の文字が表示されているかどうか" do
      expect(page).to have_title full_title('利用規約')
    end
  end
end
