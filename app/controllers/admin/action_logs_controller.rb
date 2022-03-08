class Admin::ActionLogsController < Admin::BaseController

	def index
		if current_admin.permissions == "unlimited"
			@action_logs = ActionLog.all
		else
			@action_logs = ActionLog.where(loggable_type: current_admin.log_permissions)
		end
		@action_logs = @action_logs.page(params[:page]).per(20)
		respond_to do |format|
			format.js
			format.html
		end
	end

	def show
		@action_logs = ActionLog.find(params[:id]).loggable.action_logs.includes(:admin)
		respond_to do |format|
			format.js
		end
	end

end