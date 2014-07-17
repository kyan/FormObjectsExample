class ContactForm 
  include ActiveModel::Model

  attr_accessor :nick_name, :name, :email, :message

  validates :nick_name, inclusion: ['']
  validates :name, :email, :message, presence: true
  validates :email, format: { with: /@/ }

  def save_enquiry?
    return false unless valid?
    ContactUsMailer.send_enquiry(self).deliver
  end

  def self.new_with_defaults attributes={}
    default_attributes = {}
    new default_attributes.merge(attributes)
  end
  
  # From https://github.com/plataformatec/simple_form/blob/19cb6635186eac9ea9188d988172b6cb3c884cb2/test/support/models.rb#L111-L131
  # Defines the column types for simple form.
  def column_for_attribute(attribute)
    column_type, limit = case attribute.to_sym
      when :nick_name, :name, :email then [:string]
      when :message   then [:text]
    end
    Column.new(attribute, column_type, limit)
  end

  # From https://github.com/plataformatec/simple_form/blob/ed3de1c2b566a962697529e824953f6b280e2867/test/support/models.rb#L3-L8
  # Allows SimpleForm to pick suitable input types.
  Column = Struct.new(:name, :type, :limit) do
    # Returns +true+ if the column is either of type integer, float or decimal.
    def number?
      type == :integer || type == :float || type == :decimal
    end
  end
end
