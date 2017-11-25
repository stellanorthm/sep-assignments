include 'node'

class KevinBacon

  def find_kevin_bacon(start)
    film_list = []
    start.film_actor_hash.each do | film, actors |
      actors.each do | actor |
        if start == "Kevin_Bacon"
           film_list.push(film)
        else
          find_kevin_bacon(start)
        end
      end
    end
    if film_list.length <= 6 && film_list.length != 0
      puts "Connected by #{film_list.length} films"
    else puts "Connected by more than 6 films"
    # Find the Baconator
  end

end
