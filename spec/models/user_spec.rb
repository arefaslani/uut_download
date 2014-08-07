require 'rails_helper'

describe User, :type => :model do
  before :all do
    @user = build(:user)
  end

  it "is valid" do
    expect(@user).to be_valid
  end

  it "responds to student_number" do
    expect(@user).to respond_to :student_number
  end

  it "responds to email" do
    expect(@user).to respond_to :email
  end

  it "responds to password" do
    expect(@user).to respond_to :password
  end

  it "responds to password confirmation" do
    expect(@user).to respond_to :password_confirmation
  end

  describe "student_number" do
    it "is 10 digits" do
      expect(@user.student_number.length).to eq 10
    end

    it "is all digits" do
      invalid_student_numbers = [
        "testuser",
        "882I221222"
      ].each do |stdnum|
        expect(build(:user, student_number: stdnum)).to be_invalid
      end
    end
  end

  describe "email" do
    it "is invalid when doesn't match the email format" do
      invalid_email_addresses = [
        "testuser.com",
        "testuser@test",
        "testuser.test.com",
        "@testuser.com"
      ].each do |invalid_email|
        expect(build(:user, email: invalid_email)).to be_invalid
      end
    end

    it "is valid when it matches the email format" do
      valid_email_addresses = [
        "testuser@test.com",
        "test_user@test.com",
        "test.user@test.com"
      ].each do |valid_email|
        expect(build(:user, email: valid_email)).to be_valid
      end
    end
  end
end
