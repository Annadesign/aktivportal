class Admin::UsersController < Admin::ApplicationController

	def index
		@users = User.all
	end

	def new
    	@user = User.new
    end

	def edit
		@user = User.find(params[:id])
	end

	def create
    	@user = User.new(user_params)
    	respond_to do |format|
      		if @user.save
        		format.html { redirect_to admin_users_url, notice: 'Administrator' + user_params[:fullname] + 'ble opprettet.' }
        		
      		else
       			format.html { render :new }
        	
      		end
    	end
  	end

	def update
		@user = User.find(params[:id])

		if 	@user.update(user_params)
			flash[:notice] = "Moderator was successfully updated."
			redirect_to admin_users_url
		else
			flash[:alert] = "There was a problem updating Moderator."
			render 'edit'
		end

	end

	private
		def user_params
			params.require(:user).permit(:fullname, :username, :password)
		end
end