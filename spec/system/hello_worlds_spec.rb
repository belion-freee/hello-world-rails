require "rails_helper"

RSpec.describe "HelloWorlds", type: :system, js: true do
  before(:all) {
    create(:hello_world, country: "JP", hello: "こんにちわ世界", priority: 1, file_name: "jp.jpeg")
    create(:hello_world, country: "US", hello: "Hello World", priority: 2)
    create(:hello_world, country: "CN", hello: "你好 世界", priority: 3)
  }

  before(:each) {
    visit root_path
    wait_until { (page.all("div.portfolio-item").count == 3) }
  }

  context "when go to index page" do
    it "show contents" do
      expect(page).to have_css("h1", text: "Hello World")

      content = page.first("div.portfolio-item")
      expect(content.first("p.card-text").text).to eq("こんにちわ世界")
      expect(content.first("h4.card-title")).to have_link("日本")
      expect(content.first("img.card-img-top")[:src]).to match(/jp\.jpeg/)
    end
  end

  context "when go to Show page" do
    it "show content" do
      page.first("a", text: "日本").click
      wait_until { page.has_css?("h3", text: "Helloworld Of JP") }

      content = page.first("div.form-group")
      expect(content.first("label.form-control").text).to eq("日本")
    end
  end

  context "when go to Create page" do
    after {
      HelloWorld.find_by(country: "DE").try(:destroy)
    }
    it "create content" do
      page.first("#new_hello_world").click
      wait_until { page.has_css?("h3", text: "New Helloworld") }

      # input form
      select "ドイツ", from: "hello_world_country"
      fill_in "hello_world_hello", with: "Hallo Welt"
      fill_in "hello_world_priority", with: 4

      click_on "Submit"

      wait_until { page.has_content?("Hello world was successfully created.") }

      content = page.first("div.form").all("label.form-control")
      expect(content[0].text).to eq("ドイツ")
      expect(content[1].text).to eq("Hallo Welt")
      expect(content[2].text).to eq("4")
    end
  end

  context "when go to Edit page" do
    let!(:content) { create(:hello_world, country: "DE", hello: "Hallo Welt", priority: 4) }
    before(:each) {
      visit root_path
      wait_until { (page.all("div.portfolio-item").count == 4) }
    }
    after {
      HelloWorld.find_by(country: "DE").try(:destroy)
    }
    it "edit content" do
      wait_until {
        sleep 0.1 # すげえ不本意
        page.has_css?("a#edit_#{content.id}")
      }
      page.first("a#edit_#{content.id}").click
      wait_until { page.has_css?("h3", text: "Edit Helloworld") }

      # input form
      fill_in "hello_world_hello", with: "Update Hallo Welt"

      click_on "Submit"

      wait_until { page.has_content?("Hello world was successfully updated.") }

      content = page.first("div.form").all("label.form-control")
      expect(content[0].text).to eq("ドイツ")
      expect(content[1].text).to eq("Update Hallo Welt")
      expect(content[2].text).to eq("4")
    end
  end

  context "when exec Delete" do
    let!(:content) { create(:hello_world, country: "DE", hello: "Hallo Welt", priority: 4) }
    before(:each) {
      visit root_path
      wait_until { (page.all("div.portfolio-item").count == 4) }
    }
    it "edit content" do
      wait_until {
        sleep 0.1 # すげえ不本意
        page.has_css?("a#delete_#{content.id}")
      }
      page.first("a#delete_#{content.id}").click
      wait_until { page.has_css?("h2#swal2-title", text: "Delete Content") }
      click_on "Sure"
      wait_until { page.has_css?("h2#swal2-title", text: "Deleted successfully!") }
      click_on "OK"

      wait_until { (page.all("div.portfolio-item").count == 3) }
    end
  end
end
