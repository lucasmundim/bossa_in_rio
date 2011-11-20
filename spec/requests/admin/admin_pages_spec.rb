require 'spec_helper'

describe "Admin::Pages" do
  let!(:home_page) do
    Page.create :slug => "home", :snippets_attributes => [
      {
        :section => "bottom_left",
        :translations => [
          { :locale => 'pt-BR', :body => "Some contents here" }
        ]
      },
      {
        :section => "bottom_right",
        :translations => [
          { :locale => 'pt-BR', :body => "Some more contents here" }
        ]
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
        page.should have_content(page_data.slug)
      end
    end

    it "should display a link to the details of each of the existing pages" do
      visit admin_pages_path
      Page.all.each do |page_data|
        page.should have_link(page_data.slug)
      end
    end
  end

  describe "when displaying page details" do
    it "should go the the page details page after clicking on a page in the listing" do
      visit admin_pages_path
      click_link home_page.slug
      current_path.should eq(admin_page_path(home_page))
    end

    it "should list the snippets within that page" do
      visit admin_page_path(home_page)
      home_page.snippets.each do |snippet|
        page.should have_content(snippet.section)
      end
    end

    it "should display a link to the details of each existing snippets" do
      visit admin_page_path(home_page)
      home_page.snippets.each do |snippet|
        page.should have_link(snippet.section)
      end
    end
  end
end
