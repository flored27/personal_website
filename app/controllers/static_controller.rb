class StaticController < ApplicationController

  def create
    @message = Message.new
  end

end
