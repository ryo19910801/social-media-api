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
end
