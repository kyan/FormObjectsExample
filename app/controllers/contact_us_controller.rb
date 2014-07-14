class ContactUsController < ApplicationController
  def index
    @contact_form = ContactForm.new_with_defaults
  end

  def send_enquiry
    @contact_form = ContactForm.new_with_defaults contact_form_params

    return redirect_to :thank_you if @contact_form.send_enquiry?
    render :index
  end

  def thank_you
  end

  private
  def contact_form_params
    params.require(:contact_form).permit!
  end
end
