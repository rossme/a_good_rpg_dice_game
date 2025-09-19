# frozen_string_literal: true

require "./lib/game"
require "./lib/player"

SIDES = 6
HP = 20

puts "** BATTLE DICE **"
puts "-----------------"

puts "How many sides for the dice? (default: 6)"
sides = gets.chomp.to_i
sides = SIDES if sides <= 0

puts "How many hit points for each player? (default: 20)"
hp = gets.chomp.to_i
hp = HP if hp <= 0

Game.new.play
