require 'rubygems'
require 'awesome_print'
AwesomePrint.irb!
# encoding: utf-8

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
