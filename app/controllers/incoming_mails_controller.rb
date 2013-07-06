class IncomingMailsController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    ticket_id = /Ticket: (\d*)/.match(params[:headers]["Subject"])
    if (Ticket.exists?($1))
      ticket = Ticket.find($1)
      ticket.update_description(params[:plain])
      render :text => 'success', :status => 200
    else
      render :text => 'Invalid email', :status => 404 
    end
  end
end