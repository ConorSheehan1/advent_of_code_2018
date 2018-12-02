# frozen_string_literal: true

def day_01b(arr)
  frequencies = [0]
  numbers = arr.map { |v| v.strip.to_i }
  loop do
    numbers.each do |num|
      new_v = frequencies[-1] + num
      return new_v if frequencies.include?(new_v)

      frequencies << new_v
    end
  end
end
