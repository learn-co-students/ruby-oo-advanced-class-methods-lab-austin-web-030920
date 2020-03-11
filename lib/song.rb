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

  def Song.create
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def Song.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def Song.find_by_name(song_name)
    found_song = Song.all.find{|song| song.name == song_name}
    found_song
  end
  def Song.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name)
      Song.find_by_name(song_name)
    else
      Song.create_by_name(song_name)
    end
  end

    def Song.alphabetical
      self.all.sort_by {|word| word.name}
    end
  def Song.new_from_filename(filename)
    new_array = filename.split(" - ")
    
    edited_name = new_array[1].gsub(".mp3", "")
    song = Song.new
    song.name = edited_name
    
    song.artist_name = new_array[0]
    song
  end

  def Song.create_from_filename(filename)
    new_array = filename.split(" - ")
    
    edited_name = new_array[1].gsub(".mp3", "")
    song = Song.new
    song.name = edited_name
    
    song.artist_name = new_array[0]
    song.save
  end

  def Song.destroy_all
    self.all.clear
  end

end


