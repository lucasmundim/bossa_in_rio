require "spec_helper"

describe "Home Page", :type => :feature do
  let!(:home_page) do
    page = Page.create :slug => :home, :snippets_attributes => [
      {
        :section => :bottom_left,
        :translations => [
          { :locale => 'pt-BR', :body => "Some contents here" }
        ]
      },
      {
        :section => :bottom_right,
        :translations => [
          { :locale => 'pt-BR', :body => "Some more contents here" }
        ]
      }
    ]

    # XXX: Mongoid::Globalize is keeping body in the document outside translations hash, need to reload here
    page.reload
    page
  end

  context "when I enter the home page" do
    before do
      visit root_path(:i18n_locale => 'pt-BR')
    end

    it "should display the logo in the header with a link to the home page" do
      within('#header') do
        page.should have_css("a img[src='/assets/logo_bossainrio.png']")
        page.should have_css("a[href='#{root_path(:i18n_locale => 'pt-BR')}']")
      end
    end

    it "should display the home page body sections within the contents" do
      within('#content') do
        home_page.snippets.each do |section|
          page.html.should include(section.rendered_body)
        end
      end
    end
  end
end
