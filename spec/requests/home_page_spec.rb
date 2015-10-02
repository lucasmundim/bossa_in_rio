require "spec_helper"

describe "Home Page", :type => :feature do
  let!(:home_page) do
    page = Page.create :slug => :home, :snippets_attributes => [
      {
        :section => :bottom_left,
        :body_translations => {
          'pt-BR' => "Some contents here in pt-BR",
          'en' => "Some contents here in en"
        }
      },
      {
        :section => :bottom_right,
        :body_translations => {
          'pt-BR' => "Some more contents here in pt-BR",
          'en' => "Some more contents here in en"
        }
      }
    ]

    # XXX: Mongoid::Globalize is keeping body in the document outside translations hash, need to reload here
    page.reload
    page
  end

  context "when I enter the portuguese home page" do
    before do
      visit root_path(:i18n_locale => 'pt-BR')
    end

    it "should display the logo in the header with a link to the home page" do
      within('#header') do
        expect(page).to have_css("a img[src='/assets/logo_bossainrio.png']")
        expect(page).to have_css("a[href='#{root_path(:i18n_locale => 'pt-BR')}']")
      end
    end

    it "should display the home page body sections within the contents" do
      within('#content') do
        home_page.snippets.each do |section|
          expect(page.html).to include(section.rendered_body)
        end
      end
    end
  end

  context "when I enter the english home page" do
    before do
      visit root_path(:i18n_locale => 'en')
      I18n.locale = :en
    end

    it "should display the logo in the header with a link to the home page" do
      within('#header') do
        expect(page).to have_css("a img[src='/assets/logo_bossainrio.png']")
        expect(page).to have_css("a[href='#{root_path(:i18n_locale => 'en')}']")
      end
    end

    it "should display the home page body sections within the contents" do
      within('#content') do
        home_page.snippets.each do |section|
          expect(page.html).to include(section.rendered_body)
        end
      end
    end
  end
end
