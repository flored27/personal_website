class ContactsController < ApplicationController
  protect_from_forgery with: :null_session, if: ->{request.format.json?}
#   def new
#     @contact = Contact.new
#   end
#
#   def create
#     @contact = Contact.new(params[:contact])
#     @contact.request = request
#     if @contact.deliver
#       flash[:notice] = 'Thank you for your message. We will contact you soon!'
#       redirect_to(root_url, :notice => "Message was successfully sent.")
#     else
#       alert[:error] = 'Cannot send message.'
#       redirect_to root_url
#     end
#   end
# end

def new
  @message = Message.new
 end

 def create
  @message = Message.new(params[:message])

  if @message.valid?
     NotificationsMailer.new_message(@message).deliver
     redirect_to(root_path, :notice => "Message was successfully sent.")
  else
   flash.now.alert = "Please fill all fields."
   render :new
  end

 end
end
