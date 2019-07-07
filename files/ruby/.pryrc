require 'awesome_print'
AwesomePrint.pry!

Pry.config.hooks.add_hook :after_session, :say_bye do
  puts 'bye-bye' if Pry.active_sessions == 1
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

if defined?(Rails)
  require 'rails/console/app'
  require 'rails/console/helpers'
  include Rails::ConsoleMethods
end
