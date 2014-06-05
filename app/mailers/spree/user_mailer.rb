module Spree
  class UserMailer < ActionMailer::Base
    default from: APP_CONFIG['default_email']

    def reset_password_instructions(user)
      @edit_password_reset_url = spree.edit_user_password_url(:reset_password_token => user.reset_password_token)

      mail(:to => user.email, :subject => Spree::Config[:site_name] + ' ' + I18n.t(:password_reset_instructions), :from => @from) do |format|
         format.text
      end
    end
  end
end