require 'spec_helper'

describe TicketMailer do

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  let!(:ticket) { Factory.create(:ticket, :id => 1) }
  let!(:email) { TicketMailer.submit_ticket(ticket) }

  it "appends to existing ticket", :current => true do
    original_description = ticket.description
    reply = email.clone
    reply.reply_plain = "something else"
    updated_ticket = TicketMailer.receive(reply)
    updated_ticket.should_not be_nil
    updated_ticket.should be_an_instance_of(Ticket)
    updated_ticket.should == ticket
    updated_ticket.description.should include(original_description)
    updated_ticket.description.should include(reply.reply_plain)
  end

  it "ignores invalid ids" do
    Mail::Message.any_instance.stub(:subject).and_return("Ticket: 3")
    TicketMailer.receive(mail).should be(nil)
  end

end
