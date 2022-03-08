class ContactMailer < ApplicationMailer

  def send_message(contact_message)
    @contact_message = contact_message
  	mail(to: recipient(AppInfo.email), from: "#{AppInfo.name} <#{AppInfo.no_reply_mail}>", reply_to: @contact_message.email, subject: t("contact_message.subject"))
  end

end