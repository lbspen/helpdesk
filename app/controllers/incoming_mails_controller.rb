class IncomingMailsController < ApplicationController    
  skip_before_filter :verify_authenticity_token

  def create
    ticket = TicketMailer.receive(Mail.new(params))
    if (ticket)
      render :text => 'success', :status => 200
    else
      render :text => 'Invalid email', :status => 404 
    end
  end
end