def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7          
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15          
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5           
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1           
        }


      }
    },


    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2          
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10           
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5           
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0          
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12           
        }


      }      
    }
  }
end


def num_points_scored(player)
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    b = a[:players]
    b.each_pair do |key, value|
      if key == player
        b[key].each_pair do |key, value|
          return value if key == :points
        end
      end
    end
  end
end


def shoe_size(player)
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    b = a[:players]
    b.each_pair do |key, value|
      if key == player
        b[key].each_pair do |key, value|
          return value if key == :shoe
        end
      end
    end
  end
end


def team_colors(team)
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    color = a[:colors]
    name =  a[:team_name]
    return color if name == team
  end
end


def team_names
  names_array = []
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    color = a[:colors]
    names_array << a[:team_name]
  end
  return names_array
end


def player_numbers(team)
  jersey_numbers = []
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    game_hash[key].reduce({}) do |memo, (key, value)|
    if a[:team_name] == team
      a[:players].reduce({}) do |memo, (key, value)|
        jersey_numbers << a[:players][key][:number]
      end
     end 
    end
  end
  return jersey_numbers.uniq
end


def player_stats(player)
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce({}) do |memo, (key, value)|
      return value if key == player
    end
  end
end


def big_shoe_rebounds
  big_shoe = 0 
  rebounds = 0
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce({}) do |memo, (key, value)|
    if a[:players][key][:shoe] > big_shoe
      big_shoe = a[:players][key][:shoe]
      rebounds = a[:players][key][:rebounds]
    end
    end
  end
  return rebounds
end

def most_points_scored
  most_points = 0 
  most_points_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce({}) do |memo, (key, value)|
    name = key
    if a[:players][key][:points] > most_points
      most_points = a[:players][key][:points]
      most_points_name = name
    end
    end
  end
  return most_points_name
end

def winning_team
  winner_points = 0 
  winner_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    current_points = 0
    name = a[:team_name]
    a[:players].reduce({}) do |memo, (key, value)|
      current_points += a[:players][key][:points]
    end
    if current_points > winner_points
      winner_points = current_points
      winner_name = name
    end
  end
  return winner_name
end

def player_with_longest_name
  longest_name_length = 0 
  longest_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]  
    a[:players].reduce({}) do |memo, (key, value)|
      if key.length > longest_name_length
        longest_name_length = key.length
        longest_name = key
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_rebounds = most_rebounds_scored
  p longest_name == most_rebounds

end

def most_rebounds_scored
  most_points = 0 
  most_points_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce({}) do |memo, (key, value)|
    name = key
    if a[:players][key][:steals] > most_points
      most_points = a[:players][key][:steals]
      most_points_name = name
    end
    end
  end
  return most_points_name
end 










