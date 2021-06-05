# RubyWarriorGUI
This is a Graphic implementation of the infamous Ruby command-line game RubyWarrior using Ruby on Rails.

# DEMO
[RubyWarrior GUI](https://rubywarrior.geekoi.com/rubywarrior/warriors) - Play the game

# HONORS
[Original Game and Repo](https://github.com/ryanb/ruby-warrior) - RubyWarrior by ryanb

# TECHNOLOGIES USED AND CHALLENGES
* RubyWarrior Gem Modification
    * I had to make several changes to the ruby classes of the original RubyWarrior gem in order to be able to call it from an API and AJAX Calls.
    * I had to make with AngularJS a "Animator" that responded to the RubyWarrior command-line like input and outputs
* Ruby;
    * Version 2.7.1;
* Rails;
    * Version 6.1;
* AngularJS;
    * Legacy;
* PostgreSQL;
    * 13;


# HOW TO INSTALL

```ruby
# 1. Clone the repo

git clone https://github.com/MakarovCode/RubyWarriorGUI.git

# 2. Run bundle

bundle

# 3. Run the DB

rails db:create db:migrate db:seed

# Type localhost:3000
```
