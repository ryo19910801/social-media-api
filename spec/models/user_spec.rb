require 'rails_helper'

RSpec.describe User, type: :model do
  let(:invalid_user) {build(:user, name: nil, auth_token: nil)}
  let(:valid_user) {create(:user)}

  it "is valid with a name, auth_token" do
    expect(valid_user).to be_valid
  end

  it "is invalid without a name" do
    invalid_user.valid?
    expect(invalid_user.errors[:name]).to include("can't be blank")
  end

  it "is valid if name characters less than 255" do
    user = build(:user, name: "a" * 200)
    expect(user).to be_valid
  end

  it "is valid if name characters equal 255" do
    user = build(:user, name: "a" * 255)
    expect(user).to be_valid
  end

  it "is invalid if name characters greater than 256" do
    user = build(:user, name: "a" * 256)
    user.valid?
    expect(user.errors[:name]).to include("is too long (maximum is 255 characters)")
  end

  it "is valid if self_introduction characters less than 255" do
    user = build(:user, self_introduction: "a" * 200)
    expect(user).to be_valid
  end

  it "is valid if self_introduction characters equal 255" do
    user = build(:user, self_introduction: "a" * 255)
    expect(user).to be_valid
  end

  it "is invalid if self_introduction characters greater than 256" do
    user = build(:user, self_introduction: "a" * 256)
    user.valid?
    expect(user.errors[:self_introduction]).to include("is too long (maximum is 255 characters)")
  end

  it "is valid if website_url characters less than 255" do
    user = build(:user, website_url: "a" * 200)
    expect(user).to be_valid
  end

  it "is valid if website_url characters equal 255" do
    user = build(:user, website_url: "a" * 255)
    expect(user).to be_valid
  end

  it "is invalid if website_url characters greater than 256" do
    user = build(:user, website_url: "a" * 256)
    user.valid?
    expect(user.errors[:website_url]).to include("is too long (maximum is 255 characters)")
  end

  it "is attach avatar file" do
    file = fixture_file_upload(Rails.root.join('spec', 'files', 'avatar.png'), 'image/png')
    valid_user.avatar = file
    expect(valid_user).to be_valid
  end
end
