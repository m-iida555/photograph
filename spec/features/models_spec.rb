require 'rails_helper'

RSpec.feature "モデルページ", type: :feature do
  describe "新規モデル登録" do
    background do
      visit new_model_path
    end

    scenario "新規モデルページに各種項目がある事を確認" do
       expect(page).to have_content "メインイメージ"
       expect(page).to have_content "サブイメージ"
       expect(page).to have_content "モデル名"
       expect(page).to have_content "職業"
       expect(page).to have_content "趣味"
       expect(page).to have_content "ひとこと"
    end

    scenario "モデル情報を入力するとモデルページに遷移する事を確認" do
      fill_in "girl-name-id", with: "sample"
      fill_in "model-job-id", with: "sample"
      fill_in "model-hobby-id", with: "sample"
      fill_in "model-comment-id", with: "sample"
      attach_file "model-image-id", "app/assets/images/scenes.png"
      click_button "モデル情報更新"
      expect(page).to have_content "前のモデル"
    end
  end

  describe "モデル詳細ページ" do
    background do
      @model = create(:model)
      visit model_path(@model.id)
    end

    scenario "モデル詳細に各項目が表示されているかの確認" do
      expect(page).to have_content @model.girl_name
      expect(page).to have_content @model.model_job
      expect(page).to have_content @model.model_hobby
      expect(page).to have_content @model.model_comment
      expect(page).to have_selector "img[src$= 'scenes.png']"
    end
  end

  describe "ボタンチェック" do
    background do
        @model = create(:model)
        @model2 = create(:model2)
        @model3 = create(:model3)
        visit model_path(@model2.id)
    end

    context "モデルページを移動できるかのテスト" do
      scenario "次のモデルボタン" do
        click_link "次のモデル"
        expect(current_path).to eq model_path(@model3.id)
      end

      scenario "前のモデルボタン" do
        click_link "前のモデル"
        expect(current_path).to eq model_path(@model.id)
      end
    end
  end
end
