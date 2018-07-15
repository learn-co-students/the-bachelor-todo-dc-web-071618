def get_first_name_of_season_winner(data, season)
  # code here
  data[season].each do |contestant|
      if contestant["status"] == "Winner"
        return contestant["name"].split(' ').first
      end
    end
end

def get_contestant_name(data, occupation)
  # code here
  data.each do |season, contestant|
    contestant.each do |i|
      if i["occupation"] == occupation
        return i["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # code here
  counter = 0
  data.each do |season, contestant|
    contestant.each do |i|
      if i["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  # code here
  data.each do |season, contestant|
    contestant.each do |i|
    if i["hometown"] == hometown
      return i["occupation"]
    end
  end
end
end

def get_average_age_for_season(data, season)
  # code here
  age = 0
  counter = 0
    data[season].each do |contestant|
          counter += 1
          age += contestant["age"].to_f
      end
    return (age/counter).round
end
