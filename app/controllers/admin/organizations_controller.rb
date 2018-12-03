class Admin::OrganizationsController < Admin::ApplicationController

	def index
		@organizations = Organization.all
	end

	def new
    	@organization = Organization.new
    end

	def edit
		@organization = Organization.find(params[:id])
	end

	def create
    	@organization = Organization.new(organization_params)
    	respond_to do |format|
      		if @organization.save
        		format.html { redirect_to admin_organizations_url, notice: 'Arrangør: ' + organization_params[:fullname] + 'ble opprettet.' }
        		
      		else
       			format.html { render :new }
        	
      		end
    	end
  	end

	def update
		@organization = Organization.find(params[:id])

		if 	@organization.update(organization_params)
			flash[:notice] = "Moderator was successfully updated."
			redirect_to admin_organizations_url
		else
			flash[:alert] = "There was a problem updating Moderator."
			render 'edit'
		end

	end

	private
		def organization_params
			params.require(:organization).permit(:name, :contactperson, :username, :password)
		end
end