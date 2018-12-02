# frozen_string_literal: true

def day_02a(arr)
  counts_of_two_or_three = arr.map { |v| counts(v.strip) }
  all_vals = counts_of_two_or_three.flatten
  all_vals.count(2) * all_vals.count(3)
end

def counts(string)
  # convert string to character array
  letters = string.scan(/\w/)
  counts = Hash.new(0).tap { |h| letters.each { |letter| h[letter] += 1 } }
  # return 2 or 3 if a letter appears 2 or 3 times
  counts.values.select { |v| [2, 3].include?(v) }.uniq
end
