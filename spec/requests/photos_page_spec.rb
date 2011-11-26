require "spec_helper"

describe "Photos Page" do
  let!(:photos_page) do
    Page.create :slug => :photos
  end

  before do
    3.times do |i|
      photos_page.photos.create :image => File.open(Rails.root.join('spec/fixtures/my_photo.png')), :translations => [
        {:locale => 'pt-BR', :caption => "A sample image #{i}"}
      ]
    end
  end

  context "when I enter the photos page" do
    before do
      visit photos_path(:i18n_locale => 'pt-BR')
    end

    it "should display all thumbnails for all photos of this page, with their alt/title properly set to the caption" do
      within('.conteudoSecundario') do
        photos_page.photos.each do |photo|
          page.should have_css("img[src='#{photo.image.thumb.url}']")

          image = page.find("img[src='#{photo.image.thumb.url}']")
          image['alt'].should == photo.caption
          image['title'].should == photo.caption
        end
      end
    end

    it "should display all link for thumbnails with the same rel, so that it can be used as galleries" do
      within('.conteudoSecundario') do
        photos_page.photos.each do |photo|
          image_link = page.find("a[href='#{photo.image.url}']")
          image_link['rel'].should == 'photos'
        end
      end
    end

    it "should display thumbnails inside links to the normal version of the photo, with their title properly set to the caption" do
      within('.conteudoSecundario') do
        photos_page.photos.each do |photo|
          page.should have_css("a[href='#{photo.image.url}']")

          image_link = page.find("a[href='#{photo.image.url}']")
          image_link['title'].should == photo.caption
          image_link.should have_css("img[src='#{photo.image.thumb.url}']")
        end
      end
    end
  end
end