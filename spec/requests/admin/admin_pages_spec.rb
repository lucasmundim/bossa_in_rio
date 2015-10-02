require 'spec_helper'

describe "Admin::Pages", :type => :feature do
  before :each do
    page.driver.browser.authorize('bossainrio', 'bossainriotest')
  end

  let!(:home_page) do
    Page.create :slug => "home", :snippets_attributes => [
      {
        :section => "bottom_left",
        :body_translations => { 'pt-BR' => "Some contents here" }
      },
      {
        :section => "bottom_right",
        :body_translations => { 'pt-BR' => "Some more contents here" }
      }
    ]
  end


  let!(:photos_page) do
    Page.create :slug => "photos"
  end

  describe "when listing the pages" do
    it "should list the existing pages" do
      visit admin_pages_path
      Page.all.each do |page_data|
        expect(page).to have_content(I18n.t("admin_pages.#{page_data.slug}"))
      end
    end

    it "should display a link to the details of each of the existing pages" do
      visit admin_pages_path
      Page.all.each do |page_data|
        expect(page).to have_link(I18n.t("admin_pages.#{page_data.slug}"))
      end
    end
  end

  describe "when displaying page details" do
    it "should go the the page details page after clicking on a page in the listing" do
      visit admin_pages_path
      within("table") do
        click_link I18n.t("admin_pages.#{home_page.slug}")
      end
      expect(current_path).to eq(admin_page_path(home_page))
    end

    it "should list the snippets within that page" do
      visit admin_page_path(home_page)
      home_page.snippets.each do |snippet|
        expect(page).to have_content(I18n.t("sections.#{snippet.section}"))
      end
    end

    it "should display a link to the details of each existing snippets" do
      visit admin_page_path(home_page)
      home_page.snippets.each do |snippet|
        expect(page).to have_link(I18n.t("sections.#{snippet.section}"))
      end
    end

    it "should display a link to add a photo for the page" do
      visit admin_page_path(home_page)
      expect(page).to have_link("Adicionar Foto")
    end
  end
end
