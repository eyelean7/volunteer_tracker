class Project
  attr_accessor(:name)
  attr_reader(:id)

  def initialize(attributes)
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first()['id'].to_i()
  end

  def ==(another_project)
    self.name().==(another_project.name()).&(self.id().==(another_project.id()))
  end

  def volunteers
    list_volunteers = []
    joined = DB.exec("SELECT * FROM projects_volunteers WHERE project_id = #{self.id};")
    joined.each() do |joiner|
      id = joiner['volunteer_id'].to_i()
      name = Volunteer.find(id).name()
      list_volunteers.push(Volunteer.new({:first_name => first_name, last_name => last_name, :id => id}))
    end
    return list_volunteers
  end

  def not_volunteers
    not_volunteers = []
    all_volunteers = Volunteer.all()
    volunteers = self.volunteers()
    all_volunteers.each() do |volunteer|
      if not volunteers.include?(volunteer)
        not_volunteers.push(volunteer)
      end
    end
    return not_volunteers
  end

  def update_project(attributes)
    DB.exec("UPDATE projects SET name = '#{attributes[:name]}' WHERE id = #{self.id()};")
  end

  def delete_project
  DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  # DB.exec("DELETE FROM stops WHERE project_id = #{self.id()};")
end

  class << self
    def all
      all_projects = DB.exec('SELECT * FROM projects ORDER BY name;')
      saved_projects = []
      all_projects.each() do |project|
        id = project['id'].to_i()
        name = project['name']
        each_project = Project.new({:name => name, :id => id})
        saved_projects.push(each_project)
      end
      return saved_projects
    end

    def find(id)
      found_project = nil
      Project.all().each() do |project|
        if project.id() == id
          found_project = project
        end
      end
      return found_project
    end

  end
end
