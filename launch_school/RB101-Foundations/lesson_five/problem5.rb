munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

males = munsters.select do |name, details|
  details.key('male')
end

p males

males_age = males.map do |k, v|
  v['age']
end

p males_age.sum

# or, more simply

male_age_sum = 0

munsters.each do |key, value|
  male_age_sum += value['age'] if value['gender'] == 'male'
end

p male_age_sum
  