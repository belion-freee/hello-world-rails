require "rails_helper"
require "helpers/mock_helper"

RSpec.describe "Statics", type: :request do
  describe "Show static page" do
    it "show about page" do
      get about_path
      expect(response).to render_template(:about)
    end

    it "show about page" do
      get sample_form_path
      expect(response).to render_template(:sample_form)
    end
  end

  describe "Show ghibli page" do
    before { MockHelper.mock_request(Api::GhibliApi.api_url(:films), body) }

    let(:body) {
      [
        {"id"=>"578ae244-7750-4d9f-867b-f3cd3d6fecf4", "title"=>"The Tale of the Princess Kaguya", "director"=>"Isao Takahata", "producer"=>"Yoshiaki Nishimura", "release_date"=>"2013", "rt_score"=>"100"}
      ]
    }

    it "show ghibli page" do
      get ghibli_path
      expect(response).to render_template(:ghibli)
    end

    it "show ghibli page as csv" do
      get ghibli_path(format: :csv)
      expect(response.content_type).to eq("text/csv")
      expect(response).to have_http_status(:ok)
    end
  end
end
