require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  context "バリデーション" do
    it "名前、メールアドレスがあれば有効な状態であること" do
      expect(user).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it "名前が50文字以内であること" do
      user = build(:user, name: "sample" * 9)
      expect(user).not_to be_valid
    end

    it "メールアドレスがなければ無効な状態であること" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "メールアドレスが200文字以内なら有効であること" do
      expect(user).to be_valid
      user = build(:user, email: "a" * 200 + "@gmail.com")
      expect(user).not_to be_valid
    end

    it "重複したメールアドレスなら無効な状態であること" do
      user1 = build(:user, email: "Sample@gmail.com")
      expect(user1).not_to be_valid
    end

    it "メールアドレスは小文字で保存されること" do
      user = build(:user, email: "Sample@gmail.com".upcase)
      expect(user).not_to be_valid
    end

    it "パスワードがなければ無効な状態であること" do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end

    context "authenticated?メソッド" do
      it "remember_digestが存在しない場合、エラーとなる事をテスト" do
        expect(user.authenticated?('')).not_to eq true
      end
    end
  end
end
