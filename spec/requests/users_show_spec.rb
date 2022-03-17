require "rails_helper"

RSpec.describe "プロフィール", type: :request do
  let(:user) { create(:user) }

  before do
    get user_path(user.id)
  end

  it "レスポンスが正常に返ってくるかどうか" do
    expect(response).to have_http_status "200"
  end
end
