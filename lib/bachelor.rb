require 'pry'

def get_first_name_of_season_winner(data, season)
  # binding.pry
  data[season].each do |person|
    if person["status"] == "Winner" 
      return person["name"].split(' ').first 
      # binding.pry
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, person_info|
    person_info.each do |person|
      if person["occupation"] == occupation 
        return person["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0 
  data.each do |season, person_info|
    person_info.each do |person|
      # binding.pry
      if person["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season, person_info|
    person_info.each do |person|
      if person["hometown"] == hometown 
        return person["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_sum = 0
  count = 0
  data[season].each do |person_info| 
    # binding.pry
    age_sum += person_info["age"].to_f
    count += 1
  end
  (age_sum / count).round
end
