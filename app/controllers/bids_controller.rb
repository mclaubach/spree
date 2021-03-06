class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:make]

  # GET /bids
  # GET /bids.json
  def index
    @events = Event.all
    @bids = Bid.where(event: @events)
    #@stats = StatsPresenter.new(@events).total_stats
  end

  # POST /bids/make
  def make
    BidWorker.perform_async(current_user.id, params[:event_id], params[:choice_id])
    respond_to do |format|
      format.json { render json: { status: :created } }
    end
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
    @event = Event.find(params[:event_id])
  end

  # GET /bids/new
  def new
    @event = Event.find(params[:event_id])
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @bid = @event.bids.find(params[:id])
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(bid_params)
    respond_to do |format|
      if @bid.save
        format.html { redirect_to event_bids_path, notice: 'Bid was successfully created.' }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    @bid = Bid.find(params[:id]) #@event.bids.find(params[:id])
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:user_id, :user_choice, :event_id, :correct, :choice_id)
    end
end
