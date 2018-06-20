class User < ActiveRecord::Base
  has_many :likedshows
  has_many :shows, through: :likedshows

  def like_show(show_id)
    if Show.check_if_exists_id(show_id)
      like = Likedshow.find_or_create_by(show_id: show_id, user_id: self.id, polarity: true)
    else
      puts "Sorry! That show does not exist in our database, please add it first."
    end
  end

  def dislike_show(show_id)
    if Show.check_if_exists_id(show_id)
      dislike = Likedshow.find_or_create_by(show_id: show_id, user_id: self.id, polarity: false)
    else
      puts "Sorry! That show does not exist in our database, please add it first."
    end
  end

  def find_friends
    self.likedshows.each {|liked_show| liked_show.show.display_users(self)}
  end


  def add_show(query_title) #query_title should be sanitized prior to method call
    if Show.find_by(title: query_title) == nil
      Show.create(title: query_title)
    else
      puts "This show, #{query_title}, already exists! Thank you anyway :^)."
    end
  end

  def self.sanitize_array_of_users_return_only_names(array)
    array.delete(nil)
    return_array = array.collect {|user| user.username}
    return_array
  end


end
