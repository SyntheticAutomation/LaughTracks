RSpec.describe Special do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a title' do
        special = Special.create
        expect(special).to_not be_valid
      end
      it 'should be invalid if missing a runtime' do
        special = Special.create(title: "Bill Burr: Expensive Laughter", image: "google.com")
        expect(special).to_not be_valid
      end
    end
  end
  describe 'Class Methods' do
    describe '.average_runtime' do
      it 'returns average runtime of all specials' do
        special_1 = Special.create(title: "Mitch Hedberg: Follow Me Home", runtime: 69, image: "https://cdn1.thr.com/sites/default/files/imagecache/landscape_928x523/2018/06/gettyimages-74714565-h_2018.jpg")
        special_2 = Special.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )
        special_3 = Special.create(title: "Bill Burr: Expensive Laughter", runtime: 55, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bill_Burr_by_Gage_Skidmore.jpg/220px-Bill_Burr_by_Gage_Skidmore.jpg")

        expect(Special.average_runtime).to eq(81)
      end
    end
  end
end
