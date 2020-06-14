require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do
    context "is valid parameters" do
      let(:user_params) { attributes_for(:user, :with_avatar) }
      it "return status 200" do
        post '/api/v1/users/', params: { user: user_params }
        expect(response).to have_http_status(200)
      end
      it 'return JSON response on success' do
        post '/api/v1/users/', params: { user: user_params }
        json = JSON.parse(response.body)
        expect(User.find_by_id(json["user"]["id"]).present?).to eq true
      end
      it "create a user" do
        expect {
          post '/api/v1/users/', params: { user: user_params }
        }.to change(User, :count).by(+1)
      end
    end
    context "is invalid without a name" do
      let(:invalid_user_params) { attributes_for(:user, name: nil) }
      it "return status 400" do
        post '/api/v1/users/', params: { user: invalid_user_params }
        expect(response).to have_http_status(400)
      end
      it "don't create a user" do
        expect {
          post '/api/v1/users/', params: { user: invalid_user_params }
        }.to change(User, :count).by(0)
      end
    end
  end
end
