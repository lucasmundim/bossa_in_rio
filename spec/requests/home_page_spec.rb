require "spec_helper"

describe "Home Page" do
  context "when I enter the home page" do
    before(:each) do
      visit root_path
    end

    it "should display the logo in the header with a link to the home page" do
      within('#header') do
        page.should have_css("a img[src='/assets/logo_bossainrio.png']")
        page.should have_css("a[href='#{root_path}']")
      end
    end
  end
end