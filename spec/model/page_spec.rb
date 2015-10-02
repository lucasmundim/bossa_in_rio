require "spec_helper"

describe Page do
  subject do
    Page.create :slug => :home
  end

  describe ".from_slug" do
    it "should return the first matching page from the given slug" do
      expect(Page.from_slug(subject.slug)).to eq Page.where(:slug => subject.slug).first
    end
  end
end
