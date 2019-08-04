FactoryBot.define do
  factory :hello_world do
    transient do
      file_name { "default.png" }
    end
    country { "JP" }
    sequence(:hello) {|i| "Test Hello #{i}" }
    sequence(:priority) {|i| i }
    image { Rack::Test::UploadedFile.new(Rails.root.join("db", "fixtures", "#{file_name}"), "image/jpeg") }
  end
end
