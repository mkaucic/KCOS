module Admin::AdminsHelper

  def admins_role(admin)
  	return "Superadmin" if admin.superadmin
  	return "Admin" if admin.admin
  	"Moderator"
  end

  def permission_to_edit(admin)
    (current_admin.superadmin && !admin.superadmin) || (current_admin.admin && admin.moderator?)
  end

  def permission_to_delete(admin)
    (current_admin.superadmin && !admin.superadmin) || (current_admin.admin && admin.moderator?)
  end

  # def pass_change_indicator(admin)
  #   admin.pass_changed? ? t('admin_nav.account_options') : t('change_your_password_here')
  # end

end