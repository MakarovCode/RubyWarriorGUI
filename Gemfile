source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.1', '>= 6.1.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

	gem 'railroady'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#FRONT END
gem 'jquery-rails'
gem 'font_awesome5_rails'
gem 'angularjs-rails'
gem 'rails-assets-sweetalert2', '~> 5.1.1', source: 'https://rails-assets.org'
gem 'sweet-alert2-rails'

gem 'devise'
gem "simple_token_authentication", '~> 1.0'

#ADMIN
gem 'activeadmin'
gem 'activeadmin_addons'
gem 'cancan'
gem 'active_skin'
gem "ckeditor"

#FILE UPLOADING
gem 'mini_magick'
gem 'carrierwave'
gem 'fog-aws'

gem 'whenever'#, :require => false

gem 'kaminari'

gem 'gravatar_image_tag'

gem 'bootstrap-sass', '~> 3.1.1'

gem 'open4'
gem 'rubywarrior'

#DEPLOYMENT
gem 'capistrano', '~> 3.11'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
gem 'capistrano-ssh-doctor'

gem 'sshkit-sudo'
