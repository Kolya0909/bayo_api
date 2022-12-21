class MainAdminMailer < ApplicationMailer

  def welcome_after_login(email)
    @email = email
    mail to: @email, subject: 'Welcome to bayo service again'
  end

  def send_new_password(main_admin, password)
    @email = main_admin.email
    @name = main_admin.name
    @password = password

    mail to: @email, subject: 'New password'
  end

end
