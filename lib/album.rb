class Album
  attr_reader :id
  attr_accessor :name

  @@albums = {} # class variable
  @@sold_albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an Album is added.

  def initialize(attributes) # We've added id as a second parameter.
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1  # We've added code to handle the id.
    @capacity = attributes.fetch(:capacity)
  end

  def self.all
    @@albums.values()
  end

  def self.sold_all
    @@sold_albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end

  def self.search(name)
    @@albums.values.select {|album| album.name == name}
  end

  def self.alphabet()
    @@albums.values.sort_by {|album| album.name}
  end

  def sold
    @@sold_albums[self.id] = Album.new(self.name, self.id)
    @@albums.delete(self.id)
  end
end