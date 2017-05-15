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
    project_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    volunteers.each() do |volunteer|
      first_name = volunteer.fetch("first_name")
      last_name = volunteer.fetch("last_name")
      project_id = volunteer.fetch("project_id").to_i()
      project_volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :project_id => project_id, :id => id}))
    end
    project_volunteers
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
