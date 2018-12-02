RSpec.describe 'As a visitor' do
  it 'allows user to create comedian' do
    visit '/comedians/new'

    fill_in 'comedian[name]', with: 'Paul Mooney'
    fill_in 'comedian[age]', with: '77'
    fill_in 'comedian[city]', with: 'Shreveport'

    click_button 'Submit'

    expect(current_path).to eq('/comedians')
    expect(page).to have_content('Paul Mooney')
    expect(page).to have_content('77')
    expect(page).to have_content('Shreveport')
  end
end
