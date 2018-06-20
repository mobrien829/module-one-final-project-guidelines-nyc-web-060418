class Show < ActiveRecord::Base
  has_many :likedshows
  has_many :users, through: :likedshows


  def display_users(sent_from_user = nil)
    arr = show_users_selector.collect {|liked_show| liked_show.user.username}
    puts "Media title: '#{self.title}'"
    arr = arr.uniq
    arr.delete(sent_from_user.username)
    puts arr
  end

  def count_fans
    select_users_who_like_show.length
  end

  # title_string must be sanitized before using this method

  def self.check_if_exists_title(title_string)
    if self.all.find_by(title: title_string)
      true
    else false
    end
  end

  def self.check_if_exists_id(id_int)
    if self.all.find_by(id: id_int)
      true
    else false
    end
  end

  private

  def show_users_selector
    Likedshow.all.select {|liked_show| liked_show.show_id == self.id}
  end

  def select_users_who_like_show
    show_users_selector.select {|liked_show| liked_show.polarity == true}
  end


end
