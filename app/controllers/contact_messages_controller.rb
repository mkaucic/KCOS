class ContactMessagesController < ApplicationController
  before_action :set_message, only: :create

  def create
    if @contact_message.save
      ContactMailer.send_message(@contact_message).deliver_now
    end
    respond_to do |format|
      format.js
    end
  end

  def validate
    message = ContactMessage.new(validate_params)
    message.valid?
    message_field = validate_params.keys.first.try(:to_sym)
    validation_response = !message.errors.include?(message_field)
    respond_to do |format|
      format.json { render json: {field_name: message_field, valid: validation_response, message: message.errors[message_field]} }
    end
  end

  private 
  def set_message
    @contact_message = ContactMessage.new(contact_message_params)
  end

  def contact_message_params
    params.require(:contact_message).permit(:full_name, :email, :message)
  end

  def validate_params
    params.permit(:full_name, :email, :message)
  end
end
