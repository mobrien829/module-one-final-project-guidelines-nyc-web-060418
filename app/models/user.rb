class User < ActiveRecord::Base
  has_many :likedshows
  has_many :shows, through: :likedshows

  def like_show(show_id)
    like = LikedShow.create(user_id: self.id, show_id: show_id, polarity: true)
  end

  def dislike_show(show_id)
    dislike = LikedShow.create(user_id: self.id, show_id: show_id, polarity: false)
  end

  def find_friends
    all_liked_shows.each {|show| show.display_users(self)}
  end



  def all_liked_shows
    arr = LikedShow.all.select {|liked_show| liked_show.user_id == self.id && liked_show.polarity == true}
    arr.collect {|liked_show| liked_show.show}
  end

end
