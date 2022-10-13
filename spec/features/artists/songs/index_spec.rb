#as a user
# When I visit an Artists songs index
# Then I see the title all of that artists songs
# and I see that each title is a link to the songs show page

require 'rails_helper'
RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 827, play_count: 111)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 447, play_count: 221)
  end
  it 'shows all of the titles of the songs for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end
  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title
    expect(current_path).to eq("/songs/#{@purple.id}")
  end
end