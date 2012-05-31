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

### Configuration
In default configuration you should only require rudeki in application.

More about configuration below

    > Rudeki::Config.set do |conf|
    >   # Select which methods you what highlight. 
    >   # Default is empty array but you can select methods: :p, :puts
    >   conf.methods = [:p]

    >   # If you want see where are generated errors you should set on true
    >   # Default is false
    >   conf.errors = true
    > end

You should see something like

    $ pry(main)> puts "rudeki"
    # ╔═════════ METHOD - PUTS ═════
    #   puts -> (pry):2:in `<main>'
    # rudeki
    # ╚═════════════════════════════


### Quarantine

You can limit the search bug like this exmaple

    > Rudeki::quarantine do
    >   block of code where is error
    > end

When you inssue this code you should see something like

    # ╔═════════ RUDEKI::quarantine is continues ════════════"
    #  message:"
    #     #{e.message}"
    #  backtrace:"
    #     #{e.backtrace.join("\n    ")}"
    # ╚══════════════════════════════════════════════════════"

