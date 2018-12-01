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
  it 'should be able to filter comedians by age query in URL' do
    comic_1 = Comedian.create(name: "Mitch Hedberg", age: 48, city: "San Francisco")
    comic_2 = Comedian.create(name: "Paul Mooney", age: 77, city: "Shreveport")
    comic_3 = Comedian.create(name: "Rodney Dangerfield", age: 82, city: "Deer Park")
    special_1 = comic_1.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )
    special_2 = comic_2.specials.create(title: "Paul Mooney: Help Is Not Coming", runtime: 60, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )
    special_3 = comic_3.specials.create(title: "Rodney Dangerfield: A Field of Danger", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )

    visit '/comedians?age=77'

    expect(page).to have_content(comic_2.name)
    expect(page).to have_no_content(comic_1.name)
    expect(page).to have_no_content(comic_3.name)
  end
  it 'should display total special count for each comedian' do
    comic_1 = Comedian.create(name: "Mitch Hedberg", age: 48, city: "San Francisco")
    special_1 = comic_1.specials.create(title: "Mitch Hedberg: Special 1", runtime: 120, image: "https://i.ytimg.com/vi/Uk0mJSTatbw/maxresdefault.jpg" )
    special_2 = comic_1.specials.create(title: "Mitch Hedberg: Special 2", runtime: 60, image: "https://i.ytimg.com/vi/Uk0mJSTatbw/maxresdefault.jpg" )
    special_3 = comic_1.specials.create(title: "Mitch Hedberg: Special 3", runtime: 48, image: "https://i.ytimg.com/vi/Uk0mJSTatbw/maxresdefault.jpg" )

    visit '/comedians'

    expect(page).to have_content(comic_1.specials_count)
  end
end
