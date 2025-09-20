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

puts "--------------------------"

puts "Player 1 name:"
player1_name = ""
while player1_name.strip.empty?
  player1_name = gets.chomp
  puts "You need to enter a name for Player 1" if player1_name.strip.empty?
end

puts "Player 2 name:"
player2_name = ""
while player2_name.strip.empty?
  player2_name = gets.chomp
  puts "You need to enter a name for Player 2" if player2_name.strip.empty?
end

players = [
  Player.new(hp: hp, name: player1_name),
  Player.new(hp: hp, name: player2_name)
]

puts "Starting a game with #{sides}-sided dice and #{hp} hit points each!"

Game.new(sides: sides, hp: hp, players:).play
