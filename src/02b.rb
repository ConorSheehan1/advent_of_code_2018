# frozen_string_literal: true

def day_02b(arr)
  arr.each do |string|
    matches = get_match(arr, string)
    return intersection(*matches) if matches
  end
end

# @return [String] intersection of two strings (in order only)
def intersection(str1, str2)
  out = []
  str1.scan(/\w/).each_with_index do |char, index|
    out << char if str2[index] == char
  end
  out.join
end

# @return [Array] two strings with one char difference or nil
def get_match(arr, string)
  regexes = string_to_regex(string)
  regexes.each do |r|
    matches = arr.grep(r)
    return matches if matches.count == 2
  end
  nil
end

# example: string_to_regex('ab') -> ['a.', '.b']
# @param [String] strin
# @return [Array] list of regex strings
def string_to_regex(string)
  regexes = []
  arr = string.scan(/\w/)

  arr.each_with_index do |_char, index|
    regexes << arr.each_with_index.map do |c, i|
      i == index ? '.' : c
    end.join
  end

  regexes.map { |v| Regexp.new(v) }
end
