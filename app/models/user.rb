class User < ActiveRecord::Base
  has_many :likedshows
  has_many :shows, through: :likedshows

  def like_show(show_id)
    like = Likedshow.create(user_id: self.id, show_id: show_id, polarity: true)
  end

  def dislike_show(show_id)
    dislike = Likedshow.create(user_id: self.id, show_id: show_id, polarity: false)
  end

  def find_friends
    all_liked_shows.each {|show| show.display_users(self)}
  end

  def all_liked_shows
    arr = Likedshow.all.select {|liked_show| liked_show.user_id == self.id && liked_show.polarity == true}
    arr.collect {|liked_show| liked_show.show}
  end

  def add_show(query_title) #query_title should be sanitized prior to method call
    if Show.find_by(title: query_title) == nil
      Show.create(title: query_title)
    else
      puts "This show, #{query_title}, already exists! Thank you anyway :^)."
    end
  end


end
