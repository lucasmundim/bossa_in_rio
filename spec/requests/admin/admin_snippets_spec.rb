require "spec_helper"

describe "Admin::Snippets" do
  before :each do
    page.driver.browser.authorize('bossainrio', 'bossainriotest')
  end

  let!(:home_page) do
    Page.create :slug => "home", :snippets_attributes => [
      {
        :section => "bottom_left",
        :translations => [
          { :locale => 'pt-BR', :body => "Some contents here" },
          { :locale => 'en', :body => "Some english contents here" },
          { :locale => 'fr', :body => "Some french contents here" },
          { :locale => 'es', :body => "Some spanish contents here" }
        ]
      },
      {
        :section => "bottom_right",
        :translations => [
          { :locale => 'pt-BR', :body => "Some more contents here" },
          { :locale => 'en', :body => "Some english contents here" },
          { :locale => 'fr', :body => "Some french contents here" },
          { :locale => 'es', :body => "Some spanish contents here" }
        ]
      }
    ]
  end

  let(:snippet) do
    home_page.snippets.section("bottom_left")
  end

  it "should go the the snippet details page after clicking on a snippet in the listing" do
    visit admin_page_path(home_page)
    click_link I18n.t("sections.#{snippet.section}")
    current_path.should eq(edit_admin_page_snippet_path(home_page, snippet))
  end

  describe "when editing a snippet" do
    it "should display the snippet body data for each locale" do
      visit edit_admin_page_snippet_path(home_page, snippet)
      field = page.find_field("Texto")
      field.text.should eq(snippet.translation_for("pt-BR").body)
    end
  end
end