class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all
    puts "Your USER_ID is : #{Rails.application.credentials.ally_uid[:USER_ID]}"
  end

  def balance
    # code for balance

    balanceOAuthtoken = AccountInfoManager::BalanceCaller.call
    @balances ||= balanceOAuthtoken.get("/v1/accounts/#{Rails.application.credentials.ally_uid[:USER_ID]}/balances.json", {'Accept' => 'application/json'}).body
    @balances_parsed = JSON.parse(@balances)
    puts "Balances are : #{@balances_parsed}"
  end

  def history
    #code for history
    historyOAuthtoken = AccountInfoManager::HistoryCaller.call
    @history ||= historyOAuthtoken.get("/v1/accounts/#{Rails.application.credentials.ally_uid[:USER_ID]}/history.json", {'Accept' => 'application/json'}).body
    @history_parsed = JSON.parse(@history)
    puts "History is : #{@history_parsed}"
  end

  def holding
    #code for holding
    holdingOAuthtoken = AccountInfoManager::HoldingCaller.call
    @holdings ||= holdingOAuthtoken.get("/v1/accounts/#{Rails.application.credentials.ally_uid[:USER_ID]}/holdings.json", {'Accept' => 'application/json'}).body
    @holdings_parsed = JSON.parse(@holdings)
    puts "Balances are : #{@holdings_parsed}"
  end

  # GET /stocks/1 or /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks or /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.fetch(:stock, {})
    end

end
