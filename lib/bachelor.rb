require "pry"
require "json"
data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def get_first_name_of_season_winner(data, season)
  winner = ""
  data.each do |season_number, contestant_array|
    if season_number == season
      contestant_array.each do |contestant|
        if contestant["status"] == "Winner"
          winner = contestant["name"].split(" ")[0].to_s
        end
      end
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season_number, contestant_array|
    contestant_array.each do |contestant|
      if contestant["occupation"] == occupation
        name = contestant["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_number, contestant_array|
    contestant_array.each do |contestant|
      if contestant["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  occupation = ""
  data.each do |season_number, contestant_array|
    contestant_array.find do |contestant|
      if contestant["hometown"] == hometown
        occupation = contestant["occupation"]
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  total_ages = 0
  contestant_count = 0
  data.each do |season_number, contestant_array|
    if season_number == season
      contestant_array.each do |contestant|
        total_ages += contestant["age"].to_f
        contestant_count += 1
      end
    end
  end
  average = total_ages/contestant_count
  average.round
end
  