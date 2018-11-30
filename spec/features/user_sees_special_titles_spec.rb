RSpec.describe 'A visitor to our app' do
  it 'should display the proprietary special titles for every comedian' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = comedian.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "google.com/" )
    visit '/comedians'

    expect(page).to have_content(special.title)
  end
  it 'should display runtime and thumbnail with special titles' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = comedian.specials.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "google.com/" )
    visit '/comedians'

    within("#comic-special-#{special.id}") do
      expect(page).to have_content(special.runtime)
      expect(page).to have_content(special.image)
    end
  end
end
