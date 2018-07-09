require "pry"
def get_first_name_of_season_winner(data, season)
winner = nil
  data[season].each do |full_contestant_data_array|
    full_contestant_data_array.each do |facts|
      if facts[1] == "Winner"
        winner = full_contestant_data_array["name"]
      end
    end
  end
  winner.split(" ")[0]
end

def get_contestant_name(data, occupation)
contestant = nil
  data.map do |season, every_contestant_array|
    every_contestant_array.map do |full_contestant_data_array|
      full_contestant_data_array.map do |facts|
        if facts[1] == occupation
          contestant = full_contestant_data_array["name"]
        end
      end
    end
  end
  contestant
end

def count_contestants_by_hometown(data, hometown)
hometown_count = 0
  data.map do |season, every_contestant_array|
    every_contestant_array.map do |full_contestant_data_array|
      full_contestant_data_array.map do |facts|
        if facts[1] == hometown
          hometown_count += 1
        end
      end
    end
  end
  hometown_count
end

def get_occupation(data, hometown)
occupation_list = []
  data.map do |season, every_contestant_array|
    every_contestant_array.map do |full_contestant_data_array|
      full_contestant_data_array.map do |facts|
        if facts[1] == hometown
          occupation_list << full_contestant_data_array["occupation"]
        end
      end
    end
  end
  occupation_list[0]
end

def get_average_age_for_season(data, season)
age_list = []
age_total = 0
  data[season].each do |full_contestant_data_array|
    age_list << full_contestant_data_array["age"].to_i
    age_total = age_total + full_contestant_data_array["age"].to_i
  end
  (age_total.to_f/age_list.size).round
end
