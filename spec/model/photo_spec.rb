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
        expect(subject.image).to be_no_larger_than(800, 800)
      end
    end

    context "thumb version" do
      it "should scale down the image to be exactly 90 by 90 pixels, croping it if necessary" do
        expect(subject.image.thumb).to have_dimensions(90, 90)
      end
    end
  end
end
