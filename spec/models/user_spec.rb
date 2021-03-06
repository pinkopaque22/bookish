require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    params = {
      "id" => 1,
      "oauth_token" => "lksj093475sjf"
    }
  end

  describe "has many favorites" do
    it { should have_many(:favorites) }
  end
end
