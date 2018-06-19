class Show < ActiveRecord::Base
  has_many :likedshows
  has_many :users, through: :likedshows


  def display_users
    show_users_selector.collect {|liked_show| liked_show.user.username}
  end

  def count_fans
    select_users_who_like_show.length
  end

  private

  def show_users_selector
    LikedShow.all.select {|liked_show| liked_show.show_id == self.id}
  end

  def select_users_who_like_show
    show_users_selector.select {|liked_show| liked_show.polarity == true}
  end

end
