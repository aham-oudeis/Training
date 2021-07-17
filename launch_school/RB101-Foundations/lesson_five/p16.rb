HEXES = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
DASHES_IDX = [9, 14, 19, 24]

# def generate_uuid
#   uuid_str = ''
#   count = 0

#   loop do
#     insertion = (DASHES_IDX.include?(count) ? '-' : HEXES.sample)
#     uuid_str <<  insertion

#     count += 1
#     break if count > 35
#   end

#   uuid_str
# end

# def generate_uuid
#   uuid_str = ''

#   36.times do |idx|
#     insertion = (DASHES_IDX.include?(idx) ? '-' : HEXES.sample)
#     uuid_str <<  insertion
#   end

#   uuid_str.size
# end


# def generate_uuid
#   uuid_str = ''

#   36.times do |idx|
#     insertion = (DASHES_IDX.include?(idx) ? '-' : HEXES.sample)
#     uuid_str <<  insertion
#   end

#   uuid_str.size
# end

require 'securerandom'

def generate_uuid
  SecureRandom.uuid
end

p generate_uuid