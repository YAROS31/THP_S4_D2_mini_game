require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"


  puts "Comment vous appelez vous ?"
  print "> "
  humanplayer1 = gets.chomp
  user = HumanPlayer.new(humanplayer1)
  enemies = []
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  enemies << player1
  enemies << player2

  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts user.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner" 
    puts " "
    puts "attaquer un joueur en vue :"
    print "0 - "
    puts player1.show_state
    print "1 - "
    puts player2.show_state
    print "> "
    reply = gets.chomp
    if reply =="a"
      user.search_weapon
    elsif reply =="s"
      user.search_health_pack
    elsif reply =="0"
      user.attacks(player1)
    elsif reply =="1"
      user.attacks(player2)
    else puts "nous n'avons pas compris votre réponse"
    end
    puts " "
     
    puts "Les autres joueurs t'attaquent !"
      enemies.each do |i|
      if i.life_points > 0 then
        i.attacks(user)
      end
    end  
  end
  
  puts "La partie est finie"
    if user.life_points > 0
      puts "Bravo ! Tu as gagné !"
    else
      puts "Tu as perdu"
  end
