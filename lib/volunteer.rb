class Volunteer
  attr_accessor(:first_name, :last_name, :project_id)
  attr_reader(:id)

  def initialize(attributes)
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def name
    first_name.+" ".+last_name
  end

  def save
    result = DB.exec("INSERT INTO volunteers (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
    @id = result.first()['id'].to_i()
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name()).&(self.id().==(another_volunteer.id()))
  end

  def add_project(attributes)
    DB.exec("UPDATE volunteers SET project_id = #{attributes[:project_id]} WHERE id = #{self.id()};")
  end

  def update_volunteer(attributes)
    DB.exec("UPDATE volunteers SET first_name = '#{attributes[:first_name]}', last_name = '#{attributes[:last_name]}' WHERE id = #{self.id()};")
  end

  def delete_volunteer
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
    # DB.exec("DELETE FROM stops WHERE project_id = #{self.id()};")
  end

  class << self
    def all
      all_volunteers = DB.exec('SELECT * FROM volunteers ORDER BY last_name;')
      saved_volunteers = []
      all_volunteers.each() do |volunteer|
        id = volunteer['id'].to_i()
        first_name = volunteer['first_name']
        last_name = volunteer['last_name']
        each_volunteer = Volunteer.new({:first_name => first_name, :last_name => last_name, :id => id})
        saved_volunteers.push(each_volunteer)
      end
      return saved_volunteers
    end

    def find(id)
      found_volunteer = nil
      Volunteer.all().each() do |volunteer|
        if volunteer.id() == id
          found_volunteer = volunteer
        end
      end
      return found_volunteer
    end
  end
end
