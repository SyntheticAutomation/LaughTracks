RSpec.describe 'A visitor to our app' do
  it 'should display the proprietary special titles for every comedian' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    special = Special.create(title: "Adam Sandler: Take Me Away From Here", runtime: 120, image: "google.com/", comedian_id: 1 )
    visit '/comedians'
    expect(page).to have_content(special.title)
  end
end
