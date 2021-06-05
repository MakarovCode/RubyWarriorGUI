require Rails.root + 'lib/ruby_warrior.rb'
Dir[Rails.root + 'lib/ruby_warrior/**/*.rb'].each do |file|
  require file
end