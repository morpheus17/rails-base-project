class BrokersController < ApplicationController
  before_action :set_broker, only: [ :show ]

  # display all brokers
  def index
    @brokers = User.brokers.includes(:stocks).limit(20)
  end

  # GET /samples/1 or /samples/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_broker
    # puts params[:stock_name]
    @brokers = User.brokers.includes(:stocks).where(stocks: { name: params[:stock_name]}).limit(20)
  end
end
