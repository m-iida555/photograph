require "rails_helper"

RSpec.describe "お客様情報の編集", type: :request do
  let!(:user) { create(:user) }

  before do
    get edit_user_path(user)
  end

  it "お客様情報を編集できることの確認" do
    expect(response).to render_template('users/edit')
    patch  user_path(user), params: { user: { name: "Example",
                                              email: "sampel2@gamil.com",
                                              birth_date: "1988-12-31",
                                              telephone: "12312341234",
                                              address: "N県N市" } }
    redirect_to user
    follow_redirect!
    expect(response).to render_template('users/show')
  end

  it "誤った情報ではお客様情報を更新できない事を確認" do
    expect(response).to render_template('users/edit')
    patch user_path(user), params: { user: { name: "", 
                                             email: "" } }
    expect(response).to render_template('users/edit')
  end
end