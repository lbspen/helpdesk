class TicketMailer < ActionMailer::Base
  default :from => "helpdeskuser@example.com"

  @@lastReceipt = nil

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.submit_ticket.subject
  #
  def submit_ticket(ticket)
    @ticket = ticket

    mail  :to => "lbspen@gmail.com", 
          :subject => "Ticket: " +  ticket.id.to_s,
          :reply_to => "db0a4a9cce22e0d15fc0@cloudmailin.net"
  end

  # def receive(email)
  #   logger.info "TicketMailer - received an email"
  #   if ticket_id && $1
  #     ticket = Ticket.find($1.to_i)
  #     ticket.description << email.header[plain]
  #     ticket
  #   end
  # end

end
