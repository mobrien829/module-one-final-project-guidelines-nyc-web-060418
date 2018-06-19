class LikedShow < ActiveRecord::Base
  belongs_to :show
  belongs_to :user
  # polarity is whether a user liked the show or not. True is positive, false is negative.


end
