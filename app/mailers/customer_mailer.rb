class CustomerMailer < ApplicationMailer
  def send_new_password(customer, password)
    @email = customer.email
    @name = customer.name
    @password = password

    mail to: @email, subject: 'New password'
  end
end
