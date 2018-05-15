
class MessageMailerPreview < ActionMailer::Preview
  def welcome_email
    MessageMailer.welcome_email(Message.first)
  end
end
