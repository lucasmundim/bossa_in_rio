require "spec_helper"

describe "Admin::Snippets", :type => :feature do
  before :each do
    page.driver.browser.authorize('bossainrio', 'bossainriotest')
  end

  let!(:home_page) do
    Page.create :slug => "home", :snippets_attributes => [
      {
        :section => "bottom_left",
        :body_translations => {
          'pt-BR' => "Some contents here",
          'en' => "Some english contents here",
          'fr' => "Some french contents here",
          'es' => "Some spanish contents here"
        }
      },
      {
        :section => "bottom_right",
        :body_translations => {
          'pt-BR' => "Some more contents here",
          'en' => "Some english contents here",
          'fr' => "Some french contents here",
          'es' => "Some spanish contents here"
        }
      }
    ]
  end

  let(:snippet) do
    home_page.snippets.section("bottom_left")
  end

  it "should go the the snippet details page after clicking on a snippet in the listing" do
    visit admin_page_path(home_page)
    click_link I18n.t("sections.#{snippet.section}")
    expect(current_path).to eq(edit_admin_page_snippet_path(home_page, snippet))
  end

  describe "when editing a snippet" do
    it "should display the snippet body data for each locale" do
      ['pt-BR', 'en', 'fr', 'es'].each do |locale|
        I18n.locale = :"#{locale}"
        visit edit_admin_page_snippet_path(home_page, snippet, i18n_locale: locale)
        field = page.find("#body_translations_#{locale}").value
        expect(field).to eq(snippet.body)
      end
    end
  end
end
