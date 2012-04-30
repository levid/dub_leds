module Spree
  class TestMailer < ActionMailer::Base
    def test_email(mail_method, user)
      @mail_method = mail_method
      subject = "#{Spree::Config[:site_name]} #{t('test_mailer.test_email.subject')}"
      mail(:to => user.email,
           :from => APP_CONFIG['default_host'].to_s,
           :subject => subject)
    end
  end
end
