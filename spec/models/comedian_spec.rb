RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48, city: "San Francisco")
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: "Mitch Hedberg", city: "San Francisco")
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing a city' do
        comic = Comedian.create(name: "Mitch Hedberg", age: 48)
        expect(comic).to_not be_valid
      end
    end
  end
  describe 'Class Methods' do
    describe '.average_age' do
      it 'returns mean age of all comedians'
        comic_1 = Comedian.create(name: "Mitch Hedberg", age: 48, city: "San Francisco")
        comic_2 = Comedian.create(name: "Paul Mooney", age: 77, city: "Shreveport")
        comic_3 = Comedian.create(name: "Rodney Dangerfield", age: 82, city: "Deer Park")

        expect(Comedian.average_age).to eq(69)
      end
    end
end
