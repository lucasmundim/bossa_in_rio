require "spec_helper"

describe "Home Page" do
  let!(:home_page) do
    Page.create :slug => :home, :snippets_attributes => [
      { :section => :bottom_left, :body => "Some contents here" },
      { :section => :bottom_right, :body => "Some more contents here" }
    ]
  end

  context "when I enter the home page" do
    before do
      visit root_path
    end

    it "should display the logo in the header with a link to the home page" do
      within('#header') do
        page.should have_css("a img[src='/assets/logo_bossainrio.png']")
        page.should have_css("a[href='#{root_path}']")
      end
    end

    it "should display the home page body sections within the contents" do
      within('#content') do
        home_page.snippets.each do |section|
          page.should have_content(section.body)
        end
      end
    end
  end
end