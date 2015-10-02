require "spec_helper"

describe "Photos Page", :type => :feature do
  let!(:photos_page) do
    page = Page.create :slug => :photos, :snippets_attributes => [
      {
        :section => :some_section,
        :body_translations => { 'pt-BR' => "Some contents here" }
      },
      {
        :section => :other_section,
        :body_translations => { 'pt-BR' => "Some more contents here" }
      }
    ]

    # XXX: Mongoid::Globalize is keeping body in the document outside translations hash, need to reload here
    page.reload
    page
  end

  before do
    photos_page.snippets.each do |snippet|
      3.times do |i|
        snippet.photos.create :image => File.open(Rails.root.join('spec/fixtures/my_photo.png')), :caption_translations => {
          'pt-BR' => "A sample image #{i} for #{snippet.rendered_body}"
        }
      end
    end
  end

  context "when I enter the photos page" do
    before do
      visit photos_path(:i18n_locale => 'pt-BR')
    end

    def all_photos
      photos_page.snippets.map { |s| s.photos }.flatten
    end

    it "should display all snippets" do
      within('.fotos') do
        photos_page.snippets.each do |snippet|
          expect(page.html).to include(snippet.rendered_body)
        end
      end
    end

    it "should links for thumbnails with the same rel, so that all of them can be used as one gallery" do
      within('.fotos') do
        all_photos.each do |photo|
          image_link = page.find("a[href='#{photo.image.url}']")
          expect(image_link['rel']).to eq 'photos'
        end
      end
    end

    it "should put a title on each link for the thumbnail with the photo caption" do
      within('.fotos') do
        all_photos.each do |photo|
          image_link = page.find("a[href='#{photo.image.url}']")
          expect(image_link['title']).to eq photo.caption
        end
      end
    end

    it "should display thumbnails inside links" do
      within('.fotos') do
        all_photos.each do |photo|
          image_link = page.find("a[href='#{photo.image.url}']")
          expect(image_link).to have_css("img[src='#{photo.image.thumb.url}']")
        end
      end
    end
  end
end
