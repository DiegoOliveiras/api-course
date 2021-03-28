require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  describe "#validations" do
    let(:access_token) { create(:access_token) }

    it "tests that factory is valid" do
      expect(access_token).to be_valid
      access_token.save!
      another_access_token = build :access_token
      expect(another_access_token).to be_valid
    end

    it "should have valid token" do
      access_token.token = ''
      expect(access_token).not_to be_valid
      expect(access_token.errors[:token]).to include("can't be blank")  
    end

    it "should have an unique token" do
      another_access_token = build :access_token, token: access_token.token
      expect(another_access_token).not_to be_valid
      expect(another_access_token.errors[:token]).to include("has already been taken")  
    end

    it "should have an user" do
      access_token.user = nil
      expect(access_token).not_to be_valid
    end
  end

  describe "#new" do
    it "should have a token present after iniatilize" do
      expect(AccessToken.new.token).to be_present
    end

    it "should generate unique token" do
      user = create :user
      expect{ user.create_access_token }.to change{ AccessToken.count }.by(1)
      expect(user.build_access_token).to be_valid
    end

    it "should generate token once" do
      user = create :user
      access_token = user.create_access_token
      expect(access_token.token).to eq(access_token.reload.token)
    end
  end
end
