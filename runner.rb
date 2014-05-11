#!/usr/bin/env ruby

path = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
puts "Path: #{path}"
$:.unshift path

require 'game'

game = Game.create(<<-GOL)
------------------------------------------------
------------------------***---------------------
-----------------------*--*---------------------
----------------------*-------------------------
---------------------*--------------------------
------------------------------------------------
GOL

puts "Starting GOL"

loop do
  game.next_generation
  puts game.to_s
  sleep 0.3
end
