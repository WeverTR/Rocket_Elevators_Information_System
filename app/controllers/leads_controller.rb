class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token
      
    
    def new
        @leads = Leads.new(leads_params)
    end
    def create
       
        @fullname = params[:fullname]
        @companyname = params[:companyname]
        @email = params[:email]
        @phone = params[:phone]
        @projectname = params[:projectname]
        @projectdescription= params[:projectdescription]
        @departmentincharge = params[:departmentincharge]
        @message = params[:message]

        @leads = Leads.new(fullname: @fullname, companyname: @companyname, email: @email, phone: @phone, projectname: @projectname, projectdescription: @projectdescription, departmentincharge: @departmentincharge, message: @message)
        @leads.attachment.attach(params[:Attachment])
            if @leads.save
                redirect_to index_path
            end
    end
    def leads_params
        params.require(:leads).permit(:fullname, :companyname, :email, :phone, :projectname, :projectdescription, :departmentincharge, :message, Attachment:[])
      end
end

