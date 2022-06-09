class UserMailer < ApplicationMailer
  default from: 'gz94.secretsanta@gmail.com'

  def self.draw_email(mail)
    mail(to: mail, subject: "Test mail" )
  end
end
