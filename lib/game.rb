# frozen_string_literal: true

require "./lib/player"

class Game
  def initialize(sides:, hp:, players:)
    @sides = sides
    @hp = hp
    @players = players
  end

  def play
    until winner do
      battle
    end
  end

  attr_reader :hp, :sides, :players
  attr_accessor :winner

  private

  def battle
    roll_dice_phase

    if defender.hp <= 0
      @winner = attacker
      puts "#{attacker.name} is the winner!"
    else
      puts "End of round!"
      players.rotate!
    end
  end

  def roll_dice_phase
    puts "It's #{attacker.name}'s turn to attack #{defender.name}"
    puts "Press enter to roll the dice"
    gets

    attack = roll_dice
    puts "#{attacker.name} rolled a #{attack}"

    sleep 0.5

    puts "It's #{defender.name}'s turn to defend"
    puts "Press enter to roll the dice"
    gets

    defence = roll_dice
    puts "#{defender.name} rolled a #{defence}"

    sleep 0.5

    damage = (attack - defence)

    if damage > 0
      defender.hp -= damage
      puts "#{defender.name} took #{damage} damage"
      puts "#{defender.name} has #{defender.hp} hit points left" if defender.hp > 0
    end
  end

  def roll_dice
    rand(1..sides)
  end

  def attacker
    players[0]
  end

  def defender
    players[1]
  end
end
