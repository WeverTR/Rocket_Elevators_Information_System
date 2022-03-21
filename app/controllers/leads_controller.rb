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
<<<<<<< HEAD
        @leads.attachment.attach(params[:attachment])
=======
        @leads.attachment.attach(params[:Attachment])
>>>>>>> bf13b1f82ba09c56e5cdb085b0c0c73dc9f8ebdd
            if @leads.save
                redirect_to index_path
            end
    end
    def leads_params
<<<<<<< HEAD
        params.require(:leads).permit(:fullname, :companyname, :email, :phone, :projectname, :projectdescription, :departmentincharge, :message, attachment:[])
=======
        params.require(:leads).permit(:fullname, :companyname, :email, :phone, :projectname, :projectdescription, :departmentincharge, :message, Attachment:[])
>>>>>>> bf13b1f82ba09c56e5cdb085b0c0c73dc9f8ebdd
      end
end

