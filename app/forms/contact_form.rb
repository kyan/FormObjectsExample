class ContactForm < FormObjectBase
  include ActiveModel::Model

  attr_accessor :your_name, :your_email, :message

  validates :your_name, :your_email, :message, presence: true

  def send_enquiry?
    return false
  end

  def column_for_attribute(attribute)
    column_type, limit = case attribute.to_sym
      when :your_name, :your_email then [:string]
      when :message   then [:text]
    end
    Column.new(attribute, column_type, limit)
  end

end
