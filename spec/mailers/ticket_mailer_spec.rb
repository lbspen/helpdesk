require 'spec_helper'

describe TicketMailer do

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  let!(:ticket) { Factory.create(:ticket, :id => 1) }
  let!(:mail) { TicketMailer.submit_ticket(ticket) }
  
  it "appends to existing ticket", :current => true do
    updated_ticket = TicketMailer.receive(mail)
    updated_ticket.should_not be_nil
    updated_ticket.should be_an_instance_of(Ticket)
    updated_ticket.description.should include(mail.body.decoded)
  end

  it "ignores invalid ids" do
    Mail::Message.any_instance.stub(:subject).and_return("Ticket: 3")
    TicketMailer.receive(mail).should be(nil)
  end

end
