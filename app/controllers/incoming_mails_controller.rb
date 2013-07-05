class IncomingMailsController < ApplicationController    
  skip_before_filter :verify_authenticity_token

  def create
    logger.info "IncomingMailsController#create"
    logger.info PP::pp(params)
    logger.info PP::pp(params[:plain])
    ticket = TicketMailer.receive(params[:plain])
    if (ticket)
      render :text => 'success', :status => 200
    else
      render :text => 'Invalid email', :status => 404 
    end
  end
end