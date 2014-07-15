class ContactForm 
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :email, :message, presence: true
  validates :email, format: { with: /@/ }

  def send_enquiry?
    return false unless valid?
    ContactUsMailer.send_enquiry(self).deliver
  end

  def self.new_with_defaults attributes={}
    default_attributes = {}
    new default_attributes.merge(attributes)
  end
  
  def column_for_attribute(attribute)
    column_type, limit = case attribute.to_sym
      when :name, :email then [:string]
      when :message   then [:text]
    end
    Column.new(attribute, column_type, limit)
  end

  # From https://github.com/plataformatec/simple_form/blob/master/test/support/models.rb#L3-L8
  # Allows SimpleForm to pick suitable input types.
  Column = Struct.new(:name, :type, :limit) do
    # Returns +true+ if the column is either of type integer, float or decimal.
    def number?
      type == :integer || type == :float || type == :decimal
    end
  end
end
