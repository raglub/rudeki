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
    >   # Default is false.
    >   conf.errors = true

    >   # set logdev for logger gem
    >   conf.logdev = STDOUT

    >   # You can filter out only those errors that meet regexp.
    >   # Default are all message.
    >   conf.regexp = "rails"
    > end

You should see something like

    $ pry(main)> puts "rudeki"
    # ╔═════════ METHOD - PUTS ═════
    #   puts -> (pry):2:in `<main>'
    # rudeki
    # ╚═════════════════════════════

Or (it work with conf.errors = true)

╔══════════ ERROR ══════════
║ message:   LoadError
║ ...
║ /home/rudeki/.rvm/gems/ruby-1.9.3-p194@spree/gems/railties-3.2.2/lib/rails/commands.rb:53:in `block in <top (required)>'
║ /home/rudeki/.rvm/gems/ruby-1.9.3-p194@spree/gems/railties-3.2.2/lib/rails/commands.rb:50:in `tap'
║ /home/rudeki/.rvm/gems/ruby-1.9.3-p194@spree/gems/railties-3.2.2/lib/rails/commands.rb:50:in `<top (required)>'
║ script/rails:6:in `require'
║ script/rails:6:in `<main>'
╚═══════════════════════════

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

