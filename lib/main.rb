# frozen_string_literal: true

require "./lib/game"
require "./lib/player"

SIDES = 6
HP = 20

puts "--------------------------"
puts "** A good RPG dice game **"
puts "--------------------------"

puts "How many sides for the dice? (default: 6)"
sides = gets.chomp.to_i
sides = SIDES if sides <= 0

puts "How many hit points for each player? (default: 20)"
hp = gets.chomp.to_i
hp = HP if hp <= 0

puts "Starting a game with #{sides}-sided dice and #{hp} hit points each!"

Game.new(sides: sides, hp: hp).play
