class User < ActiveRecord::Base

  attr_reader :name, :id

  def initialize(name = nil, id = nil)
    @name = name
    @id = id
  end



end
