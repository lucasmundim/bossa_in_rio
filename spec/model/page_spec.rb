require "spec_helper"

describe Page do
  subject do
    Page.create :slug => :home
  end

  describe ".from_slug" do
    it "should return the first matching page from the given slug" do
      Page.from_slug(subject.slug).should == Page.where(:slug => subject.slug).first
    end
  end
end