require('spec_helper')

describe(Project) do

  describe('#name') do
    it ("returns the name of the project") do
      project = Project.new({:name => "Feed the Children"})
      expect(project.name()).to eq("Feed the Children")
    end
  end
  describe('.all') do
    it "returns all projects" do
      project = Project.new({:name => "Feed the Children"})
      project.save()
      expect(Project.all()).to eq([project])

    end
  end
end
