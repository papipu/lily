class Mailer < ActionMailer::Base
  
  def send(mail_to,text,from,sent_at = Time.now)
    subject    'Papipu mailer'
    recipients mail_to
    from       from
    sent_on    sent_at
    body [:text] => text
  end

end
