require('spec_helper')

describe(Volunteer) do
  volunteer = Volunteer.new({:first_name => "Ilene", :last_name => "Gorski"})

  describe('#id') do
    it "returns the volunteer id" do
      expect(volunteer.id()).to eq(volunteer.id())
    end
  end

  describe('#name') do
    it ("returns the name of the volunteer") do
      expect(volunteer.name()).to eq("Ilene Gorski")
    end
  end

  describe('#project_id') do
    it("returns the id of the project the volunteer is assigned to") do
      volunteer = Volunteer.new({:first_name => "Ilene", :last_name => "Gorski", :project_id => 4})
      expect(volunteer.project_id()).to eq(4)
    end
  end
  describe('#save') do
    it ("saves a volunteer to the database") do
      volunteer.save()
      expect(volunteer.name()).to eq("Ilene Gorski")
      # name = Volunteer.find(volunteer.id()).name()
      # expect(name).to eq("Ilene Gorski")
    end
  end

  describe('#==') do
    it("returns true if volunteers have the same name and id") do
      volunteer.save()
      volunteer2 = Volunteer.find(volunteer.id())
      expect(volunteer).to eq(volunteer2)
    end
  end

  describe('#add_project') do
    it ("adds a project id in the volunteer table") do
      volunteer = Volunteer.new({:first_name => "Ilene", :last_name => "Gorski"})
      volunteer.save()
      project = Project.new({:name => "Feed the Children"})
      project.save()
# binding.pry
      volunteer.add_project({:project_id => project.id()})
      volunteer.save()
      expect(volunteer.project_id()).to(eq(project.id()))
    end
  end

  describe('#update_volunteer') do
    it ("updates the volunteer's information in the database") do
      volunteer = Volunteer.new({:first_name => "Eileen", :last_name => "Gorski"})
      volunteer.save()
      volunteer.update_volunteer({:first_name => "Ilene", :last_name => "Gorski"})
      volunteer = Volunteer.find(volunteer.id())
      expect(volunteer.name()).to(eq("Ilene Gorski"))
    end
  end

  describe('#delete_volunteer') do
    it ("deletes a volunteer") do
      volunteer = Volunteer.new({:first_name => "Ilene", :last_name => "Gorski"})
      volunteer.save()
      volunteer.delete_volunteer()
      expect(Volunteer.all()).to eq([])
    end
  end

  describe('.all') do
    it "returns all volunteers" do
      volunteer.save()
      expect(Volunteer.all()).to eq([volunteer])
    end
  end

  describe('.find') do
    it ("finds a volunteer from the database") do
      volunteer.save()
      found = Volunteer.find(volunteer.id())
      expect(found).to eq(volunteer)
    end
  end

end
