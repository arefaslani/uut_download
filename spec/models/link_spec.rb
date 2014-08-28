require 'rails_helper'

describe Link do
  let(:link) { build(:link) }

  it "has a valid factory" do
    expect(link).to be_valid
  end

  it "responds to type" do
    expect(link).to respond_to :type
  end

  it "responds to address" do
    expect(link).to respond_to :address
  end

  describe "type" do
    it "should be http" do
      valid_types = ['http']
      valid_types.each do |type|
        expect(build(:link, type: type)).to be_valid
      end
    end
  end
end
