class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token
      
    def new
        @leads = Leads.new
    end
    def create

        @FullName = params[:FullName]
        @CompanyName = params[:CompanyName]
        @Email = params[:Email]
        @Phone = params[:Phone]
        @ProjectName = params[:ProjectName]
        @ProjectDescription= params[:ProjectDescription]
        @DepartmentInCharge = params[:DepartmentInCharge]
        @Message = params[:Message]

        @leads = Leads.new(FullName: @FullName, CompanyName: @CompanyName, Email: @Email, Phone: @Phone, ProjectName: @ProjectName, ProjectDescription: @ProjectDescription, DepartmentInCharge: @DepartmentInCharge, Message: @Message)
        
            if @leads.save
                redirect_to index_path
            end
    end
end

