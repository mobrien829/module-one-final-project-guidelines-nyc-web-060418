class User < ActiveRecord::Base


  def like_show(show_id)
    like = LikedShow.create(user_id: self.id, show_id: show_id, polarity: true)
  end

  def dislike_show(show_id)
    dislike = LikedShow.create(user_id: self.id, show_id: show_id, polarity: false)
  end



end
