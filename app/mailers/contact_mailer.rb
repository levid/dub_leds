class ContactMailer < ActionMailer::Base
  default from: "i.wooten@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #
  def send_contact_email(contact)
    @subject = contact.subject
    @from    = contact.email
    @sent_on = Time.now
    @contact = contact

    # Send an attachment
    # attachments['terms.pdf'] = File.read('/path/terms.pdf')

    # In this case it will look for templates at app/views/notifications with name another.
    #          :template_path => 'notifications',
    #          :template_name => 'another'

    mail(:to => @from, :subject => @subject, :from => @from ) do |format|
       format.html
       format.text
    end
  end
end
