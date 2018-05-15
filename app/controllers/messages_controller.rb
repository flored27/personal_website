class MessagesController < ApplicationController
    protect_from_forgery with: :null_session, if: ->{request.format.json?}
  # POST /users
  # POST /users.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        # Tell the UserMailer to send a welcome email after save
        MessageMailer.welcome_email(@message).deliver_now

        format.html { redirect_to(root_url, :notice => 'Message was successfully sent.') }
        format.json { render json: @message, status: :created, location: @message }
      else
        flash.now.alert = "Please fill all fields."
        # format.html { render action: 'new' }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def run
    User.find_each do |user|
      UserMailer.weekly_summary(user).deliver_now
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :phone, :body)
  end



end
