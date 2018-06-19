class LikedShow < ActiveRecord::Base

  attr_reader :user_id, :show_id, :id

  def initialize(user_id, show_id, polarity = true, id = nil)
    @user_id = user_id
    @show_id = show_id
    @id = id
    @polarity = polarity
  end

  # polarity is whether a user liked the show or not. True is positive, false is negative.

end
