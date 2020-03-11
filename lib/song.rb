require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    x = self.new
    x.name = name
    x
  end

  def self.create_by_name(string)
    x = self.create
    x.name = string
    x
  end

  def self.find_by_name(string)
    @@all.find{|song| song.name == string}
  end

  def self.find_or_create_by_name(string)
    find_by_name(string) || create_by_name(string)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    song = self.new
    edited = filename.gsub(".mp3","")
    
    artist, song_name = edited.split(" - ")
    song.name = song_name
    song.artist_name = artist

    song
  end

  def self.create_from_filename(filename)
    song = self.create
    edited = filename.gsub(".mp3","")
    
    artist, song_name = edited.split(" - ")
    song.name = song_name
    song.artist_name = artist

    song
  end

  def self.destroy_all
    self.all.clear
    #@@all.clear #=> also would work.
  end

end
