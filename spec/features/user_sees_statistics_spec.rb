RSpec.describe 'A visitor to our app' do
  it 'displays an area at the top of the page called Statistics' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = comedian.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )
    visit '/comedians'

    expect(page).to have_content("Statistics")
    
    within("#statistics") do
      expect(page).to have_content(Comedian.average_age)
      expect(page).to have_content(Special.average_runtime)
      expect(page).to have_content("Brooklyn")
      expect(page).to have_content(Special.count)

    end
  end
end
