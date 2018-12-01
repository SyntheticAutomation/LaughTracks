RSpec.describe 'A visitor to our app' do
  it 'should display a list of comedians and their info' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = comedian.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )
    visit '/comedians'

    expect(page).to have_content(comedian.name)
    expect(page).to have_content(comedian.age)
    expect(page).to have_content(comedian.city)
  end

  it 'should display comedian info in the correct place' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = comedian.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )

    visit '/comedians'
    within("#comedian-#{comedian.id}") do #targetting specific items within page elements
      expect(page).to have_content(comedian.name)
    end
  end
end
