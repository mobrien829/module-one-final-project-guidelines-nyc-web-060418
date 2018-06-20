require 'pry'

class Likedshow < ActiveRecord::Base
  belongs_to :show
  belongs_to :user
  # polarity is whether a user liked the show or not. True is positive, false is negative.

  # def self.find_or_create_by(show_id_input, user_id_input, polarity)
  #   if self.find_by('user_id = ?, show_id = ?', user_id_input, show_id_input) == nil
  #     Likedshow.create(user_id: user_id_input, show_id: show_id_input, polarity: polarity)
  #   else
  #     puts "You are already associated with this show :^)."
  #   end
  # end

end
