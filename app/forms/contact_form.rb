class ContactForm < FormObjectBase
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :email, :message, presence: true
  validates :email, format: { with: /@/ }

  def send_enquiry?
    return false unless valid?
    ContactUsMailer.send_enquiry(self).deliver
  end

  def column_for_attribute(attribute)
    column_type, limit = case attribute.to_sym
      when :name, :email then [:string]
      when :message   then [:text]
    end
    Column.new(attribute, column_type, limit)
  end

end
