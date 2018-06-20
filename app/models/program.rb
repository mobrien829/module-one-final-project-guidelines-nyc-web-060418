require_relative '../../config/environment'

class Program

  attr_accessor :user

  def greeting
    puts "Hello! Welcome to Isaac Fiore and Michael O'Brien's application!"
  end

  def start
    greeting
    login
    display_options
    option_selector
  end

  def login
    puts "Please enter your username"
    name = STDIN.gets.chomp
    if User.find_by(username: name) == nil
      @user = User.create(username: name)
    else
      @user = User.find_by(username: name)
    end
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
      show = get_user_input
      id = Show.find_by(title: sanitize_user_input(show)).id
      self.user.like_show(id)
    end
  end

  # private

  def sanitize_user_input(user_input)
    split_input = user_input.split(" ")
    capitalized_input = split_input.collect {|word| word.capitalize}
    capitalized_input.join(" ")
  end
end