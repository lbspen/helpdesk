class IncomingMailsController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    logger.info "incomingmailscontroller#create params[:plain]: #{params[:plain]}"
    logger.info "incomingmailscontroller#create params[:html]: #{params[:header]["Subject"]}"
    ticket = TicketMailer.receive(Mail.new(params))
    if (ticket)
      render :text => 'success', :status => 200
    else
      render :text => 'Invalid email', :status => 404 
    end
  end
end