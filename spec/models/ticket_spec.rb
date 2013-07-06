require 'spec_helper'

describe Ticket do
  it "updates the description" do
    ticket = Ticket.new(:title => "title", :description => "description")
    ticket.update_description("new")
    assert_match /new*.description/m, ticket.description
  end
end