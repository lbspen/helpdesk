class TicketMailer < ActionMailer::Base
  default from: "helpdeskapp@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.submit_ticket.subject
  #
  def submit_ticket(ticket)
    @ticket = ticket

    mail  to: "helpdesk@example.org", 
          subject: "New ticket: " +  ticket.title
  end
end
