# frozen_string_literal: true

def main(arr)
  frequencies = [0]
  numbers = arr.map { |v| v.strip.to_i }
  # while true
  loop do
    numbers.each do |num|
      new_v = frequencies[-1] + num
      return new_v if frequencies.include?(new_v)

      frequencies << new_v
    end
  end
end

# result = main(File.readlines('in/01a.txt'))

# File.open('out/01b.rb', 'w') do |f|
#   f.write(result)
# end
