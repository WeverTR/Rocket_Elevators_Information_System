class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /quotes or /quotes.json
  def index
    warden.authenticate!
    @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
    warden.authenticate!
  end

  # GET /quotes/new
  def new
    warden.authenticate!
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
    warden.authenticate!
  end

  # POST /quotes or /quotes.json
  def create
    # @quote = quotes.new(title: "...", body: "...")

    @buildingtype= params[:buildingtype] 
    @numofapt= params[:numofapt]  
    @numoffloors= params[:numoffloors]
    @numofbase= params[:numofbase]
    @numofpark= params[:numofpark]
    @numofcomp= params[:numofcomp]
    @numofelev= params[:numofelev]
    @maxocc= params[:maxocc]
    @bushrs= params[:bushrs]
    @corp= params[:corp]
    @liftCage= params[:liftCage]
    @elevatorNum= params[:elevatorNum]
    @unitPrice= params[:unitPrice]
    @totalPriceElevators= params[:totalPriceElevators]
    @installFees= params[:installFees]
    @totalPrice= params[:totalPrice]
    @email= params[:email]
    @companyname= params[:companyname]

    @quote = Quote.new(buildingtype: @buildingtype, numofapt: @numofapt, numoffloors: @numoffloors, numofbase: @numofbase, numofpark: @numofpark, numofcomp: @numofcomp, numofelev: @numofelev, maxocc: @maxocc, bushrs: @bushrs, corp: @corp, liftCage: @liftCage, elevatorNum: @elevatorNum, unitPrice: @unitPrice, totalPriceElevators: @totalPriceElevators, installFees: @installFees, totalPrice: @totalPrice, email: @email, companyname: @companyname)
    
        respond_to do |format|
          if @quote.save
            format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
            format.json { render :show, status: :created, location: @quote }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @quote.errors, status: :unprocessable_entity }
          end
        end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    warden.authenticate!
    @quote = Quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
