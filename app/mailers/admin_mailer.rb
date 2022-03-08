class AdminMailer < ApplicationMailer
  def send_credentials(admin, token)
    @admin = admin
    @token = token
    mail(to: recipient(@admin.email), from: "#{AppInfo.name} <#{AppInfo.email}>", reply_to: "#{AppInfo.email}", subject: t("mailing.cms_credentials.subject"))
  end
end
