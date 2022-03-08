class Admin::AdminAccountsController < Admin::BaseController
	before_action :restrict_access

	def edit
	end

	def update
		if @admin.update_with_password(admin_params)
	    sign_in(@admin, bypass: true) unless current_admin != @admin
			redirect_to admin_root_path, notice: t('updated_successfully')
		else
			render 'edit'
		end
	end

	private

		def restrict_access
			# redirect_to admin_root_path, notice: t('permission_denied') unless current_admin.id != params[:id].to_i
			@admin = current_admin
		end

    def admin_params
    	params.require(:admin).permit(:email, :image, :first_name, :last_name, :password, :password_confirmation, :current_password)
    end

end