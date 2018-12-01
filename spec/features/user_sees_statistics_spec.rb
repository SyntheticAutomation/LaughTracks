RSpec.describe 'A visitor to our app' do
  it 'displays an area at the top of the page called Statistics' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = comedian.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )
    visit '/comedians'

    expect(page).to have_content("Statistics")

    within("#statistics") do
      expect(page).to have_content("Average Comedian Age:\n#{Comedian.average_age}")
      expect(page).to have_content("Average Special Length:\n#{Special.average_runtime}")
      expect(page).to have_content("Cities:\nBrooklyn")

      within("#special-count") do
        expect(page).to have_content(Special.count)
      end
    end
  end
  it 'only shows statistics for comedians matching query params' do
    comic_1 = Comedian.create(name: "Mitch Hedberg", age: 48, city: "San Francisco")
    comic_2 = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special_1 = comic_1.specials.create(title: "Mitch Hedberg: Special 1", runtime: 120, image: "https://i.ytimg.com/vi/Uk0mJSTatbw/maxresdefault.jpg" )
    special_2 = comic_1.specials.create(title: "Mitch Hedberg: Special 2", runtime: 60, image: "https://i.ytimg.com/vi/Uk0mJSTatbw/maxresdefault.jpg" )
    special_3 = comic_1.specials.create(title: "Mitch Hedberg: Special 3", runtime: 48, image: "https://i.ytimg.com/vi/Uk0mJSTatbw/maxresdefault.jpg" )
    special_4 = comic_2.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/08/01/16/sandler-3.jpg" )

    visit '/comedians?age=48'
    within("#statistics") do
      expect(page).to have_content("Average Comedian Age:\n#{Comedian.first.age}") #rather have this as @comedians.average_age
      expect(page).to have_content("Number of Specials:\n#{Comedian.first.specials.count}") #rather have this as @specials.count or Special.count
      expect(page).to have_content("Average Special Length:\n#{Comedian.first.specials.average_runtime}") #rather have this as @specials.average_runtime
      expect(page).to have_content("Cities:\nSan Francisco") #-----why do i have to call Comedian.first, why does Comedian return both, and why does @comedians not work?
      expect(page).to have_no_content("Average Comedian Age:\n50")
      expect(page).to have_no_content("Number of Specials: 4")
      expect(page).to have_no_content("Brooklyn")
      #is this communicating with controller at all? there is an age parameter so @comedians should be accessible. do i need to require the controller file at the top here?
    end
  end
end
