class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{name} a #{life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "Toutes mes condoléances, le joueur #{name} a été tué."
    end
  end

  def attacks(player)
    puts "le joueur #{name} attaque le joueur #{player.name}" #nom du player
    attack_damage = compute_damage
    puts "#{name} lui inflige #{attack_damage} points de dommages"
    player.gets_damage(attack_damage) #Fais subir les dégâts à l'autre Player
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1 # j'ai rajouté cette ligne pour le niveau de l'arme
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    super
  end

  def compute_damage
    return rand(1..6) * @weapon_level
    super
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Cette nouvelle arme est meilleure que votre arme actuelle : vous la prenez."
    else
      puts "M@*#$... cette arme n'est pas mieux que votre arme actuelle..."
    end
  end

  def search_health_pack
    try = rand(1..6)
    if try == 1
      puts "Tu n'as rien trouvé... "
    elsif try <= 2 && try >= 5
      @life_points = [100, @life_points+50].min
      puts "Bravo, tu as trouvé un pack de +50 points de vie ! Tu as désormais #{life_points} points de vie."
    else
      @life_points = [100, @life_points+80].min
      puts "Waow, tu as trouvé un pack de +80 points de vie ! Tu as désormais #{life_points} points de vie."
    end
  end
end