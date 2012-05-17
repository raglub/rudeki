# RUDEKI

rudeki is acronym RUby DEbug KIt

Gem can show where are used methods puts, p.


## Installation

Add this line to your application's Gemfile:

    gem 'rudeki'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rudeki

## Usage

In default configuration you should only require rudeki in application.

More about configuration below

    Rudeki::Config.set do |conf|
      # Select which methods you what highlight. 
      # Default ars p, puts
      conf.methods = [:p]

      # If you want see where are generated errors you should set on true
      # Default is true
      conf.errors = false
    end

You should see something like

    pry(main)> puts "rudeki"
    ╔═════════ METHOD - PUTS ═════
      puts -> (pry):2:in `<main>'
    rudeki
    ╚═════════════════════════════
