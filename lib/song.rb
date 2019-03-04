require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    song = @@all.find {|song| song.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil
    self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
                                          # describe '.new_from_filename' do
                                          #   it 'initializes a song and artist_name based on the filename format' do
                                          #     song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

                                          #     expect(song.name).to eq("For Love I Come")
                                          #     expect(song.artist_name).to eq("Thundercat")
                                          #   end
                                          # end
  def self.new_from_filename(filename)
    song = Song.new
    song.artist_name = filename.split(" - ")[0]
    a = filename.split(" - ")[1]
    a2 = a.slice!(".mp3")
    song.name = a

  end

  def self.create_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end
# binding.pry
end
