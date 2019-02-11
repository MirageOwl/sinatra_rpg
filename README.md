# Sinatra RPG

This is my first project using Sinatra web framework.
You can find more information on Sinatra from this link: http://sinatrarb.com/

## Why a game?

While it's debatable if this counts as a game, it has some game inspired elements.
I really enjoy making games and I test out any tool I learn in this context.

## What is the purpose of this any way?

The purpose here was to learn about Sinatra web framework and HAML markup  language, which captivated me with its ease of use. HAML integrates with ruby seamlessly and works great as a templating system.

## How do I get it running?

First make sure to install the required gems which are:
- thin
- haml
- sinatra
You can do this either by hand or using bundler with the Gemfile with command: `bundle install`.

Note: On Windows machines the gem eventmachine which is a dependency has to be uninstalled and installed again using `--platform=ruby`

Then just run `ruby app.rb` and you are good to go!
