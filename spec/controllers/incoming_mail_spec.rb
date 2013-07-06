require 'spec_helper'

describe IncomingMailsController do

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  let!(:ticket) { Factory.create(:ticket, :id => 1) }
  let!(:params) do 
    params = { :headers => {}, :plain => "additional" }
    params[:headers] = { "Subject" => "Ticket: 1" }
    params
  end

  it "Receives a valid email" do
    Ticket.stub(:find).and_return(ticket)
    ticket.should_receive(:update_description).with(params[:plain])
    post :create, params
    response.status.should == 200    
  end

  it "ignores invalid ids" do
    params[:headers]["Subject"] = "Ticket: 5"
    post :create, params
    response.status.should == 404
  end

  it "ignores no subject" do
    params[:headers].delete("Subject")
    post :create, params
    response.status.should == 404
  end

  it "ignores misformed subject" do
    params[:headers]["Subject"] = "abc"
    post :create, params
    response.status.should == 404
  end
end