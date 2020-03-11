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
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name=(name)
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name=(name)
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    return self.all.sort_by { |name| name.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist
    return song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist
    return song
  end

  def self.destroy_all
    self.all.clear
    
  end
end
