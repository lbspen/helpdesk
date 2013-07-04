require 'spec_helper'

describe TicketsController do
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "Sends an email" do
    ActionMailer::Base.delivery_method = :test
    description = "Description"
    title = "Title"
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post :create, ticket: { description: description, title: title }
    end
    ticket_email = ActionMailer::Base.deliveries.last
 
    assert_match /New ticket/, ticket_email.subject
    assert_match(/#{title}.*#{description}/m, ticket_email.decode_body)
  end
end