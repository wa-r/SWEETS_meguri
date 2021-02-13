class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['SEND_MAIL'],
         from: 'sample@sample.com',
         subject: 'お問い合わせのお知らせ'
  end
end
