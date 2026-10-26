class GameCharacter
  attr_reader :health

  def initialize(health)
    @health = health
  end

  def takeHit(damage)
    raise NotImplementedError, "#{self.class} must implement takeHit"
  end

  # Default attack returns 1
  def attack
    1
  end
end

class Wizard < GameCharacter
  def initialize(health, spellDamage)
    super(health)           
    @spellDamage = spellDamage
  end

  def takeHit(damage)
    false
  end

  def attack
    @spellDamage
  end
end


class Warrior < GameCharacter
  def initialize(health, shield)
    super(health)          
    @shield = shield
  end


  def takeHit(damage)
    net_damage = damage - @shield
    @health -= net_damage
    @health >= 0          
  end
end


characters = []

2.times do |i|
  print "Enter a wizard (1) or a warrior (2): "
  choice = gets.chomp.to_i

  print "Enter health: "
  health = gets.chomp.to_i

  if choice == 1
    print "Enter spell damage: "
    spell_damage = gets.chomp.to_i
    characters << Wizard.new(health, spell_damage)
  else
    print "Enter shield strength: "
    shield = gets.chomp.to_i
    characters << Warrior.new(health, shield)
  end
end

puts "The battle begins!"

alive = [true, true]
turn = 0  

while alive[0] && alive[1]
  attacker_idx = turn % 2
  defender_idx = (turn + 1) % 2

  attacker = characters[attacker_idx]
  defender = characters[defender_idx]

  damage = attacker.attack
  puts "Character #{attacker_idx + 1} attacks for #{damage} damage"

  survived = defender.takeHit(damage)

  if survived
    puts "Character #{defender_idx + 1} has #{defender.health} health points left"
  else
    puts "Character #{defender_idx + 1} has 0 health points left"
    alive[defender_idx] = false
  end

  turn += 1
end

2.times do |j|
  if alive[j]
    puts "Character #{j + 1} wins"
  else
    puts "Character #{j + 1} died"
  end
end