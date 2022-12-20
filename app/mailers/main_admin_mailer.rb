class MainAdminMailer < ApplicationMailer

  def welcome_after_login(email)
    @email = email
    mail to: @email, subject: 'Welcome to bayo service again'
  end

end
