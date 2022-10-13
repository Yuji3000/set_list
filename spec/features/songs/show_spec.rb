require 'rails_helper'

RSpec.describe 'the songs show page' do
  describe 'as a user' do
    describe "when I visit a song show page" do
      it 'displays song title, length and play count ' do
        artist = Artist.create!(name: 'Carly Rae Jepsen')

        # song_1 = Song.create!(title: "chicken friend" , length: 233, play_count: 12, artist_id: artist.id)
        # song_2 = Song.create!(title: "Call Me Maybe" , length:233, play_count:123232, artist_id:artist.id)

        song_1 = artist.songs.create!(title: "chicken friend" , length:233, play_count:12, artist_id: artist.id)
        song_2 = artist.songs.create!(title: "Call Me Maybe" , length:2334, play_count:123232, artist_id: artist.id)

        visit "/songs/#{song_1.id}"

        expect(page).to have_content(song_1.title)
        expect(page).to have_content(song_1.length)
        expect(page).to have_content(song_1.play_count)
      end
    end
  end
end
# describe "as a user" do
#   describe "when I visit a song show page" do
#     it 'displays song title' do
#       artist = Artist.create!(name: 'Carly Rae Jepsen')
#       song_1 = artist.songs.create!(title: "chicken friend" , length:233, play_count:12)
#       song_2 = artist.songs.create!(title: "Call Me Maybe" , length:2334, play_count:123232)
      
#       visit "/songs/#{songs.id}"

#       expect(page).to have_content(song_1.title)
#       expect(page).to_not have_content(song_2.title)
#     end

# it 'displays name of the artist for the song' do
#   artist = Artist.create!(name: 'Carly Rae Jepsen')
#   song_1 = artist.songs.create!(title: "chicken friend" , length:233, play_count:12)
#   song_2 = artist.songs.create!(title: "Call Me Maybe" , length:2334, play_count:123232)
  
#   visit "/songs/#{song.id}"
#   save_and_open_page
#   expect(page).to have_content(artist.name)
# end
