require 'rails_helper'

RSpec.describe Artist, type: :model do
  # binding.pry
  it {should have_many :songs} 

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 827, play_count: 111)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 446, play_count: 221)
        @other_song = @prince.songs.create!(title: 'other song', length: 1, play_count: 221)
      end
      it 'returns the average song length' do

        expect(@prince.average_song_length.round(2)).to eq(424.67)
      
      end
    end
  end
end