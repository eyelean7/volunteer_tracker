class Volunteer
  attr_accessor(:first_name, :last_name)
  attr_reader(:id)

  def initialize(attributes)
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def name
    first_name.+" ".+last_name
  end

end
