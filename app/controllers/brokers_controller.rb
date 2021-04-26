class BrokersController < ApplicationController
  before_action :set_broker, only: [ :show ]

  # display all brokers
  def index
    if params["ticker"]
      @brokers = User.brokers.includes(:stocks).where(stocks: { name: params[:ticker]}).limit(20)
    else
      @brokers = User.brokers.includes(:stocks).limit(20)
    end
  end

  # GET /samples/1 or /samples/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_broker
    puts params
    @brokers = User.brokers.where(id: params[:id]).includes(:stocks).limit(20)
  end
end
