class Admin::ContactInfosController < Admin::BaseController
  before_action :set_contact_info, only: [:edit, :update]

  def index
    @contact_info = ContactInfo.first_or_initialize
  end

  def edit
    respond_to do |format|
      format.js { render 'admin/contact_infos/edit.js.erb', object: @contact_info.id }
    end
  end

  def update
    respond_to do |format|
      if @contact_info.update(contact_info_params)
        format.js { render js: "location.reload();" }
      else
        format.js { render 'admin/contact_infos/edit.js.erb', object: @contact_info.id }
      end 
    end
  end

  private

  def set_contact_info
    @contact_info = ContactInfo.first_or_initialize
  end

  def contact_info_params
    params.require(:contact_info).permit(:name, :address, :email, :phone, :longitude, :latitude, :iban, :mb, :image, :oib)
  end

end
