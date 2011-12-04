require "spec_helper"

describe Photo do
  include CarrierWave::Test::Matchers

  before do
    PhotoUploader.enable_processing = true
  end

  after do
    PhotoUploader.enable_processing = false
  end

  describe "upload" do
    subject do
      Photo.create :image => File.open(Rails.root.join('spec/fixtures/my_photo.png'))
    end

    context "normal version" do
      it "should scale down the image to fit within 800 by 800 pixels" do
        subject.image.should be_no_larger_than(800, 800)
      end
    end

    context "thumb version" do
      it "should scale down the image to be exactly 74 by 74 pixels, croping it if necessary" do
        subject.image.thumb.should have_dimensions(74, 74)
      end
    end
  end
end