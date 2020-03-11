require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def Song.create
    song = self.new
    song.save
    song 
  end 

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end 

  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end 

  def self.find_by_name(title)
    self.all.find{|n| n.name == title}
  end 

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end 

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end 

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
  end 

  def self.destroy_all
    @@all = self.all.clear
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

