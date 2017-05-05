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
  end
end
