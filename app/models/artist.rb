class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
   self.songs.average(:length)
  end

  # def songs
  #   Song.where(artist_id: id)
  # end

  def song_count
    self.songs.count
  end

  #without and with associations test line 42
  def wrote_song?(song)
    songs.include?(song)
  end

  

end