require 'rails_helper'

RSpec.describe "Homes", type: :request do

  it "GET root_path" do
    get root_path
    # puts response.body
    expect(response).to be_successful
    # expect(response.body).to include("HOME")
  end

  it "GET about_path" do
    get about_path
    # puts response.body
    expect(response).to be_successful
    # expect(response.body).to include("About")
  end

  it "GET about_path" do
    get about_path
    expect(response).to be_successful
    # expect(page).to include("About")
  end
end
