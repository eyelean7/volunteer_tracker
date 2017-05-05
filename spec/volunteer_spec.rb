require('spec_helper')

describe(Volunteer) do

  describe('#name') do
    it ("returns the name of the volunteer") do
      volunteer = Volunteer.new({:first_name => "Ilene", :last_name => "Gorski"})
      expect(volunteer.name()).to eq("Ilene Gorski")
    end
  end

end
