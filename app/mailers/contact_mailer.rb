class ContactMailer < ApplicationMailer
  def send_mail(details)
    @details = details
    subject = "New Contact Lead"
    mail to: "bilal@goget.my", subject: subject
  end
end
