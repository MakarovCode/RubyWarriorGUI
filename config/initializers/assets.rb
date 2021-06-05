# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.3'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(angular.min.js)  
Rails.application.config.assets.precompile += %w(angular-sanitize.js)  
Rails.application.config.assets.precompile += %w(angular-route.js)
Rails.application.config.assets.precompile += %w( ckeditor/* )
Rails.application.config.assets.precompile += %w(forums/*)
Rails.application.config.assets.precompile += %w(semantic.js)
Rails.application.config.assets.precompile += %w(semantic.css)
Rails.application.config.assets.precompile += %w(components/*)
Rails.application.config.assets.precompile += %w(images/*)
Rails.application.config.assets.precompile += %w(rubywarrior/*)
Rails.application.config.assets.precompile += %w(modules/HOLAMUNDO.js)
Rails.application.config.assets.precompile += %w(modules/tutorial.js)
Rails.application.config.assets.precompile += %w(modules/forem.js)
Rails.application.config.assets.precompile += %w(forem.js)
Rails.application.config.assets.precompile += %w(forem.css)

Rails.application.config.assets.precompile += %w(themes/default/assets/fonts/icons.eot)
Rails.application.config.assets.precompile += %w(themes/default/assets/fonts/icons.otf)
Rails.application.config.assets.precompile += %w(themes/default/assets/fonts/icons.svg)
Rails.application.config.assets.precompile += %w(themes/default/assets/fonts/icons.ttf)
Rails.application.config.assets.precompile += %w(themes/default/assets/fonts/icons.woff)
Rails.application.config.assets.precompile += %w(themes/default/assets/fonts/icons.woff2)
Rails.application.config.assets.precompile += %w(themes/basic/assets/fonts/icons.eot)
Rails.application.config.assets.precompile += %w(themes/basic/assets/fonts/icons.svg)
Rails.application.config.assets.precompile += %w(themes/basic/assets/fonts/icons.ttf)
Rails.application.config.assets.precompile += %w(themes/basic/assets/fonts/icons.woff)





