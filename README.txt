Compile and Deploy Instructions:
- Navigate to the source code folder in Command/Terminal
- Make sure to have installed rbenv (https://github.com/rbenv/rbenv#homebrew-on-mac-os-x)
Ruby 2.2.4 and RubyGems (https://rubygems.org/pages/download)
- use 'gem install x' for the following gems:
  - sinatra
  - sass
  - rack
  - tilt
  - bundler
- once installed run 'bundle install'
- then run 'bundle exec rackup'

This will run the app locally at localhost:9292

To deploy to heroku:
- Install Heroku Toolbelt (https://toolbelt.heroku.com/)
- run 'heroku login' and login with your credentials
- run 'heroku create x' where x is the name of your choice
- once created run 'git push heroku master'
- then run 'heroku open' and it should open the app in browser.
