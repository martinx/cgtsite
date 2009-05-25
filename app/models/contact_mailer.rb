class ContactMailer < ActionMailer::Base
  def contact(recipient)
    subject    recipient[:subject]
    recipients recipient[:sendto]
    from       ["#{recipient[:name]}<#{recipient[:email]}>"] 
    body       "#{recipient[:message]}"
    reply_to   recipient[:email]
  end
end
