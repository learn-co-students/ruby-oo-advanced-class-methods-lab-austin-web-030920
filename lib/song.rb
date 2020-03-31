require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.find {|x| x.name === name}
  end

  def self.find_or_create_by_name(name)
    ( self.find_by_name(name) || self.create_by_name(name) )
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name.downcase }
  end

  def self.new_from_filename(file_name)
    song = Song.new
    string = file_name.gsub(".mp3", "")
    artist, song_name = string.split(" - ")

    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    song = self.create
    string = file_name.gsub(".mp3", "")
    artist, song_name = string.split(" - ")

    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
