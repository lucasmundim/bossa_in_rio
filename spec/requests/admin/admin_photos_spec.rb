require 'spec_helper'

describe "Admin::Photos", :type => :feature do
  before do
    page.driver.browser.authorize('bossainrio', 'bossainriotest')
  end

  let!(:home_page) do
    Page.create :slug => "home", :snippets_attributes => [
      { :section => "bottom_left" },
      { :section => "bottom_right" }
    ]
  end

  context "when adding a photo" do
    context "to a page" do
      it "should add the photo" do
        visit admin_page_path(home_page)
        click_link "Adicionar Foto"

        attach_file "Arquivo", 'spec/fixtures/my_photo.png'

        I18n.available_locales.each do |locale|
          within("##{locale}") do
            fill_in "Legenda", :with => "caption in #{locale}"
          end
        end

        click_button I18n.t('helpers.submit.create', :model => I18n.t("mongoid.models.#{Photo.model_name.to_s.downcase}"))

        expect(page).to have_link("caption in #{I18n.locale}")
      end
    end

    context "to a snippet" do
      it "should add the photo" do
        visit edit_admin_page_snippet_path(home_page, home_page.snippets.section("bottom_left"))
        click_link "Adicionar Foto"

        attach_file "Arquivo", 'spec/fixtures/my_photo.png'

        I18n.available_locales.each do |locale|
          within("##{locale}") do
            fill_in "Legenda", :with => "caption in #{locale}"
          end
        end

        click_button I18n.t('helpers.submit.create', :model => I18n.t("mongoid.models.#{Photo.model_name.to_s.downcase}"))

        expect(page).to have_link("caption in #{I18n.locale}")
      end
    end
  end

  context "when listing photos" do
    let!(:photos) do
      2.times.map do |index|
        imageable.photos.create :image => File.open(Rails.root.join('spec/fixtures/my_photo.png')), :caption_translations => {
          'pt-BR' => "image caption #{index}"
        }
      end
    end

    context "of a page" do
      let(:imageable) { home_page }

      it "should list all images of the page" do
        visit admin_page_path(home_page)

        photos.each do |photo|
          expect(page).to have_link(photo.caption)
        end
      end
    end

    context "of a section" do
      let(:imageable) { home_page.snippets.section("bottom_left") }

      it "should list all images of the page" do
        visit edit_admin_page_snippet_path(home_page, home_page.snippets.section("bottom_left"))

        photos.each do |photo|
          expect(page).to have_link(photo.caption)
        end
      end
    end
  end
end
