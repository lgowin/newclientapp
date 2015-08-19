class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_filter :get_client

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = @client.sessions.find(:all, :order => 'dateservice desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = @client.sessions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json {render json: @session }
    end
  end

  # GET /sessions/new
  def new
    @client = Client.find(params[:client_id])
    @session = @client.sessions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { redner json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = @client.sessions.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    #@session = @client.sessions.build(params[:session])
    @session = @client.sessions.create(session_params)
    # @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to client_url(@client), notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    #@session = @client.sessions.update!(session_params)

    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to client_url(@client), notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = @client.sessions.find(params[:id])
    @session.destroy
    respond_to do |format|
      format.html { redirect_to client_url(@client), notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    def get_client
      @client = Client.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:dateservice, :copayowed, :copayd, :claimsubmit, :claimrecvd, :claimowed, :claimpd, :cptcode, :sessionnotes, :client_id)
    end
end
