class FormObjectBase
  # From https://github.com/plataformatec/simple_form/blob/master/test/support/models.rb#L3-L8
  # Allows SimpleForm to pick suitable input types.

  Column = Struct.new(:name, :type, :limit) do
    # Returns +true+ if the column is either of type integer, float or decimal.
    def number?
      type == :integer || type == :float || type == :decimal
    end
  end

  def self.new_with_defaults attributes={}
    default_attributes = {}
    new default_attributes.merge(attributes)
  end
end
