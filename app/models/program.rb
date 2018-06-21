require_relative '../../config/environment'
require 'pry'

class Program

  attr_accessor :user, :onoff

  def initialize
    @onoff = nil
  end

  def greeting
    puts "Hello! Welcome to Isaac Fiore and Michael O'Brien's application!"
  end

  def exit_message
    puts "Goodbye!"
  end

  def start
    @onoff = 1
    greeting
    login
    while @onoff == 1
      display_options
      option_selector
      sleep(2)
    end
    exit_message
  end

  def login
    puts "Please enter your username"
    name = STDIN.gets.chomp
    @user = User.find_or_create_by(username: name)
  end

  def logout
    @user = nil
  end

  def display_options
    puts "Enter the number to choose task"
    puts "Menu:"
    puts "1 - Become a fan"
    puts "2 - Become a hater"
    puts "3 - Add data to a show"
    puts "4 - Find other users who like your shows"
    puts "5 - All shows"
    puts "6 - All shows that you've liked"
    puts "7 - Logout and exit"
    puts "8 - Add show to database"
  end

  def get_user_input
    STDIN.gets.chomp
  end

  def option_selector
    input = get_user_input
    case input
    when "1"
      puts "Please enter the name of the show/movie you'd like to become a fan of."
      id = Show.find_by(title: sanitize_user_input(get_user_input)).id
      self.user.like_show(id)
    when "2"
      puts "Please enter the name of the show/movie you'd like to become a hater of."
      id = Show.find_by(title: sanitize_user_input(get_user_input)).id
      self.user.dislike_show(id)
    when "3"
      puts "Enter title of the show you want to update"
      selected_show = Show.where(title: sanitize_user_input(get_user_input)).first
      self.info_update_menu
      self.info_update_selector(selected_show)
    when "4"
      puts "Here are other people with similar interests!"
      self.user.find_friends
    when "5"
      puts Show.all.collect {|show| show.title}
    when "6"
      puts self.user.likedshows.collect {|liked_show| liked_show.show.title}
    when "7"
      self.logout
      @onoff = 0
    when "8"
      puts "Enter show name here"
      Show.find_or_create_by(title: sanitize_user_input(get_user_input))
    else
      puts "Sorry! That was an invalid input."
    end

  end


      def info_update_selector(selected_show)
        input = get_user_input
        case input
          when "1"
            puts "Enter genre"
            sani_info = sanitize_user_input(get_user_input)
            selected_show.genre = sani_info
            selected_show.save
          when "2"
            puts "Enter media (Show, Movie, or Animated) here"
            selected_show.media = sanitize_user_input(get_user_input)
            selected_show.save
          when "3"
            puts "Enter updated title"
            sani_title = sanitize_user_input(get_user_input)
            selected_show.title = sani_title
            selected_show.save
          when "4"

          else puts "Sorry, that is an invalid command."
        end
      end

          def info_update_menu
            puts "1 - Add/update genre"
            puts "2 - Add/update medium"
            puts "3 - Add/update title"
            puts "4 - Return to main menu"
          end

  # private

  def sanitize_user_input(user_input)
    split_input = user_input.split(" ")
    capitalized_input = split_input.collect {|word| word.capitalize}
    capitalized_input.join(" ")
  end

end
