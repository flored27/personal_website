class MessageMailer < ApplicationMailer
  default from: 'DiegoJFlores.com'

  def welcome_email(message)
    @message = message
    @url  = 'http://example.com/login'
    mail(to: 'dflores@fandm.edu', subject: @message.name)
    #subject message does not work with back ticks and interpolation,
    #"Welcome email" becomes the default

    #Cannot mix strings with @message.name, you get an internal error
  end
end
