require "spec_helper"

describe Photo do
  include CarrierWave::Test::Matchers

  describe "when retriving photos by tags" do
    it "should return all photos with one of the given tags" do
      criteria = mock(Mongoid::Criteria)
      Photo.should_receive(:where).with(:tags.in => ["nice", "ugly", "common"]).and_return(criteria)
      Photo.by_tags("nice", "ugly", "common").should == criteria
    end
  end

  describe "when returning all photos grouped by some tags" do
    let!(:photo_abc) do
      Photo.create :tags => ['a', 'b', 'c']
    end

    let!(:photo_cde) do
      Photo.create :tags => ['c', 'd', 'e']
    end

    let!(:photo_efa) do
      Photo.create :tags => ['e', 'f', 'a']
    end

    let!(:photo_unknown) do
      Photo.create :tags => ['k', 'y', 'z']
    end

    it "should group photos by their tags, based on the given tags" do
      photos = Photo.grouped_by_tags(['a', 'c', 'd'])
      photos['a'].should == [photo_abc, photo_efa]
      photos['c'].should == [photo_abc, photo_cde]
      photos['d'].should == [photo_cde]
      photos[''].should == [photo_unknown]
    end

    it "should not return a grouped tag unless it has one photo" do
      photos = Photo.grouped_by_tags(['a', 'l'])
      photos.should_not have_key('l')
    end

    it "should not return the empty group unless it has one photo" do
      Photo.destroy_all
      photos = Photo.grouped_by_tags([])
      photos.should_not have_key('')
    end
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