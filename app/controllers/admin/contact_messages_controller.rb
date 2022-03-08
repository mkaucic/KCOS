class Admin::ContactMessagesController < Admin::BaseController
  before_action except: :show do
    restrict_access(:contact_messages)
  end

	def show
		@contact_message = ContactMessage.find(params[:id])
		@contact_message.add_reader(current_admin) unless @contact_message.read_by(current_admin)
		respond_to do |format|
			format.js
		end
	end

	def index
		@contact_messages = ContactMessage.all
	end

end