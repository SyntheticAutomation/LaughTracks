RSpec.describe 'A visitor to our app' do
  it 'should display a list of comedians and their info' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    visit '/comedians'

    expect(page).to have_content(comedian.name)
    expect(page).to have_content(comedian.age)
    expect(page).to have_content(comedian.city)
  end

  it 'should display comedian info in the correct place' do
    comedian = Comedian.create(name: "Adam Sandler", age: 52, city: "Brooklyn" )
    visit '/comedians'

    expect(comedian_list).to have_content(comedian.name)
  end
end
