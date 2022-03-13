class QuoteController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
        @quote = Quote.new
    end
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
            @quote = Quote.new(buildingtype: @buildingtype, numofapt: @numofapt, numoffloors: @numoffloors, numofbase: @numofbase, numofpark: @numofpark, numofcomp: @numofcomp, numofelev: @numofelev, maxocc: @maxocc, bushrs: @bushrs, corp: @corp, liftCage: @liftCage, elevatorNum: @elevatorNum, unitPrice: @unitPrice, totalPriceElevators: @totalPriceElevators, installFees: @installFees, totalPrice: @totalPrice)
        
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
          def quote_params
            # params.require(:quote)
          end

end
