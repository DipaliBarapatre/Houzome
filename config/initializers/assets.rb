# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = (ENV["ASSETS_VERSION"] || "1.0")

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( homepage.js homepage.css)
Rails.application.config.assets.precompile += %w( builders.js builders.css)
Rails.application.config.assets.precompile += %w( apartments.js apartments.css)
Rails.application.config.assets.precompile += %w( admin.js admin.css)
Rails.application.config.assets.precompile += %w( dashboard.js dashboard.css)