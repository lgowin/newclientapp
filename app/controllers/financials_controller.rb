class FinancialsController < ApplicationController
  before_action :set_financial, only: [:show, :edit, :update, :destroy]

  # GET /financials
  # GET /financials.json
  def index
    @sessions = Session.all.order( 'dateservice DESC' ).paginate(:page => params[:page], :per_page => 100)

    respond_to do |format|
      format.html
      format.csv { send_data @sessions.to_csv }
      format.xls # { send_data @sessions.to_csv(col_sep: "\t") }
    end
  end

  # GET /financials/1
  # GET /financials/1.json
  def show
  end

  # GET /financials/new
  def new
    @financial = Financial.new
  end

  # GET /financials/1/edit
  def edit
  end

  # POST /financials
  # POST /financials.json
  def create
    @financial = Financial.new(financial_params)

    respond_to do |format|
      if @financial.save
        format.html { redirect_to @financial, notice: 'Financial was successfully created.' }
        format.json { render :show, status: :created, location: @financial }
      else
        format.html { render :new }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financials/1
  # PATCH/PUT /financials/1.json
  def update
    respond_to do |format|
      if @financial.update(financial_params)
        format.html { redirect_to @financial, notice: 'Financial was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial }
      else
        format.html { render :edit }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financials/1
  # DELETE /financials/1.json
  def destroy
    @financial.destroy
    respond_to do |format|
      format.html { redirect_to financials_url, notice: 'Financial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_params
      params[:financial]
    end
end
