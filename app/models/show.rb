class Show < ActiveRecord::Base

  attr_reader :name, :id

  def initialize(name, genre = nil, id = nil)
    @name = name
    @genre = genre
    @id = id
  end

end
