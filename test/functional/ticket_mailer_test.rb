require 'test_helper'

class TicketMailerTest < ActionMailer::TestCase
  test "submit_ticket" do
    mail = TicketMailer.submit_ticket
    assert_equal "Submit ticket", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
