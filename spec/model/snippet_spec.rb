require "spec_helper"

describe Snippet do
  let(:page) do
    Page.create :slug => :home
  end

  let(:section) { "some_section" }

  subject do
    page.snippets.create :section => section, :body => %{
      h3. Some contents

      Here is a paragraph

      h4. Another header

      And a paragraph
    }
  end

  describe "rendering body" do
    it "should render the textiled body into a HTML" do
      subject.rendered_body.should == RedCloth.new(subject.body).to_html
    end
  end

  describe ".section" do
    before do
      page.snippets.create :section => "Other section", :body => "Some body"
      subject # creates subject
    end

    it "should return the first section matching the given value" do
      page.snippets.section(section).should == page.snippets.where(:section => section).first
    end
  end
end