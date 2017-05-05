require('spec_helper')

describe(Project) do
  project = Project.new({:name => "Feed the Children"})

  describe('#id') do
    it "returns the project id" do
      expect(project.id()).to eq(project.id())
    end
  end

  describe('#name') do
    it ("returns the name of the project") do
      expect(project.name()).to eq("Feed the Children")
    end
  end

  describe('#save') do
    it ("saves a project to the database") do
      project.save()
      name = Project.find(project.id()).name()
      expect(name).to eq("Feed the Children")
    end
  end

  describe('#==') do
    it("returns true if projects have the same name and id") do
      project.save()
      project2 = Project.find(project.id())
      expect(project).to eq(project2)
    end
  end

  describe('#==') do
    it("returns true if projects have the same name and id") do
      project.save()
      project2 = Project.find(project.id())
      expect(project).to eq(project2)
    end
  end

  # describe('#volunteers') do
  #   it ("lists volunteers working on project") do
  #     project = Project.new({:name => "Meals on Wheels"})
  #     project.save()
  #     volunteer = Volunteer.new({:first_name => "Ilene", :last_name => "Gorski", :project_id => project.id()})
  #     volunteer.save()
  #     expect(project.volunteers()).to eq(["Ilene Gorski"])
  #   end
  # end

  describe('#delete_project') do
    it ("deletes a project") do
      project = Project.new({:name => "Meals on Wheels"})
      project.save()
      project.delete_project()
      expect(Project.all()).to eq([])
    end
  end

  describe('.all') do
    it "returns all projects" do
      project.save()
      expect(Project.all()).to eq([project])
    end
  end

  describe('.find') do
    it ("finds a project from the database") do
      project.save()
      found = Project.find(project.id())
      expect(found).to eq(project)
    end
  end

end
