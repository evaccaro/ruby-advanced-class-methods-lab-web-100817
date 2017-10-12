class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song|song.name}
  end

  def self.new_from_filename(file_name)
    new_song = Song.new
    file = file_name.split(/[-.]/).map(&:strip)
    new_song.name = file[1]
    new_song.artist_name = file[0]
    new_song
  end


  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
