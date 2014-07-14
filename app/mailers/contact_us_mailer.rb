class ContactUsMailer < ActionMailer::Base
  default from: 'contact_form@example.com'

  def send_enquiry(contact_form)
    @contact_form = contact_form
    
    mail subject: 'You have an new Enquiry'
  end
end
