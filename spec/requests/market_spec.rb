require 'rails_helper'

RSpec.describe "Markets", type: :request do
  describe "requests" do

    before do
      @role = create :role, :buyer 
      @buyer =  create :user, :buyer, id: 1, role_id: @role.id
      res1 = sign_up_buyer(@buyer)
      # puts res1
      res2 = sign_in_as_a_valid_user(@buyer)
      # puts res2
    end


    let(:create_market) {create(:market, id: 1, name: 'MSFT', user_id: @buyer.id)}

    # GET index
    it {
      @market = create_market
      get market_path
      
      expect(response.status).to eq(200)
      expect(response.body).to include("MSFT")
    }
    
    # POST show_stock_in_modal
    it {
      post show_stock_in_modal_path, params: {
        stock_name: "FB",
        seller_id: nil
      }, xhr: true

      expect(response.status).to eq(200)
      expect(response.body).to include("FB")
    }

    # POST search_stock_in_market
    it {
      post search_stock_in_market_path, params: {
        ticker_input: "FB",
      }, xhr: true
      
      expect(response.status).to eq(200)
      expect(response.body).to include("FB")
    }

    # POST add_stock_to_market
    it {
      post add_stock_to_market_path, params: {
        name: "FB",
      }, xhr: true
     
      expect(response.status).to eq(200)
      # expect(response.body).to include("FB")

      get market_path
      
      expect(response.status).to eq(200)
      expect(response.body).to include("FB")
    }

    # DESTROY delete_stock_from_market
    it {
      @market = create_market
      delete delete_stock_from_market_path, params: {id: @market.id}

      
      expect(response.status).to eq(302) # redirected

      get market_path
      expect(response.status).to eq(200)
      expect(response.body).not_to include("MSFT")
    }
  end
end
