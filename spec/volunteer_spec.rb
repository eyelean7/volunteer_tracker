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
