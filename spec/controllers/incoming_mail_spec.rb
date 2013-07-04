require 'spec_helper'

describe IncomingMailsController do

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  let!(:message) {"From: abc.com\r\nSubject: New Poster\r\n\r\nContent"}

  it "Receives an invalid email" do
    TicketMailer.any_instance.stub(:receive)
    post :create, :message => message 
    response.status.should == 404
  end

  it "Receives a valid email" do
    TicketMailer.any_instance.stub(:receive).and_return(Ticket.new)
    post :create, :message => message
    response.status.should == 200    
  end
end