# This class is needed since Mongoid doesn't support Multi-parameter
# attributes in version 4.0 before it's moved to active model in rails 4
#
# https://github.com/mongoid/mongoid/issues/2954
#

require "spec_helper"

describe Mongoid::MultiParameterAttributes do

  describe "#process" do

    class Multi
      include Mongoid::Document
      include Mongoid::MultiParameterAttributes
      field :created_at, type: Time
      field :dob, type: Date
      field :checked_at, as: :last_user_checked_at, type: Time
    end

    context "creating a multi" do

      let(:multi) do
        Multi.new(
          "created_at(1i)" => "2010",
          "created_at(2i)" => "8",
          "created_at(3i)" => "12",
          "created_at(4i)" => "15",
          "created_at(5i)" => "45"
        )
      end

      it "sets a multi-parameter Time attribute correctly" do
        expect(multi.created_at).to eq(Time.zone.local(2010, 8, 12, 15, 45))
      end

      it "does not leave ugly attributes on the model" do
        expect(multi.attributes).not_to have_key("created_at(1i)")
      end
    end

    context "creating a multi" do

      context "with a valid DOB" do

        let(:multi) do
          Multi.new({
            "dob(1i)" => "1980",
            "dob(2i)" => "7",
            "dob(3i)" => "27"
          })
        end

        it "sets a multi-parameter Date attribute correctly" do
          expect(multi.dob).to eq(Date.civil(1980, 7, 27))
        end
      end

      context "with an invalid DOB" do

        let(:invalid_multi) do
          Multi.new({
            "dob(1i)" => "1980",
            "dob(2i)" => "2",
            "dob(3i)" => "31"
          })
        end

        it "uses Time's logic to convert the invalid date to valid" do
          expect(invalid_multi.dob).to eq(Time.new(1980, 2, 31).to_date)
        end
      end
    end

    context "with a blank DOB" do

      let(:multi) do
        Multi.new(
          "dob(1i)" => "",
          "dob(2i)" => "",
          "dob(3i)" => ""
        )
      end

      it "generates a nil date" do
        expect(multi.dob).to be_nil
      end
    end

    context "with a partially blank DOB" do

      let(:multi) do
        Multi.new(
          "dob(1i)" => "1980",
          "dob(2i)" => "",
          "dob(3i)" => ""
        )
      end

      it "sets empty date's year" do
        expect(multi.dob.year).to eq(1980)
      end

      it "sets empty date's month" do
        expect(multi.dob.month).to eq(1)
      end

      it "sets empty date's day" do
        expect(multi.dob.day).to eq(1)
      end
    end

    context "with aliased field" do

      let(:multi) do
        Multi.new(
          "last_user_checked_at(1i)" => "2010",
          "last_user_checked_at(2i)" => "8",
          "last_user_checked_at(3i)" => "12",
          "last_user_checked_at(4i)" => "15",
          "last_user_checked_at(5i)" => "45"
        )
      end

      it "sets a multi-parameter Time attribute correctly" do
        expect(multi.last_user_checked_at).to eq(Time.zone.local(2010, 8, 12, 15, 45))
      end

      it "does not leave ugly attributes on the model" do
        expect(multi.attributes).not_to have_key("created_at(1i)")
      end
    end
  end
end
