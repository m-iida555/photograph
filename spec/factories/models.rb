FactoryBot.define do
  factory :model, class: "Model" do
    id { 1 }
    girl_name { "sample-name" }
    model_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/scenes.png')) }
    model_job { "sample-job" }
    model_hobby { "sample-hobby" }
    model_comment { "sample-comment" }
    model_image_sub { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no-image.png')) }
  end

  factory :model2, class: "Model" do
    id { 2 }
    girl_name { "sample-name2" }
    model_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/scenes.png')) }
    model_job { "sample-job2" }
    model_hobby { "sample-hobby2" }
    model_comment { "sample-comment2" }
    model_image_sub { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no-image.png')) }
  end

  factory :model3, class: "Model" do
    id { 3 }
    girl_name { "sample-name3" }
    model_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/scenes.png')) }
    model_job { "sample-job3" }
    model_hobby { "sample-hobby3" }
    model_comment { "sample-comment3" }
    model_image_sub { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no-image.png')) }
  end
end
