# frozen_string_literal: true

# @param [Array] arr
# @return [Integer] length of polymer
def day_05a(arr)
  string = arr[0]
  get_polymer(string.scan(/\w/)).length
end

# @param [Array] chars
# @return [String]
def get_polymer(chars)
  old_chars = chars
  new_chars = collapse_matches(old_chars)
  while old_chars != new_chars
    old_chars = new_chars
    new_chars = collapse_matches(old_chars)
  end
  new_chars.join("")
end

# @param [String] char
# @return [Boolean]
def upper?(char)
  /[A-Z]/.match(char)
end

# @param [String] char
# @return [Boolean]
def lower?(char)
  /[a-z]/.match(char)
end

# @param [Array] arr
# @return [Boolean] array contains uppercase and lower case version of la etter
def match?(arr)
  small = arr.select { |v| lower?(v) }.first
  big = arr.select { |v| upper?(v) }.first
  small && big && (small.upcase == big)
end

# @param [Array] arr
# @return [Array]
def collapse_matches(arr)
  output = []
  i = 0
  while i < arr.length
    pair = arr[i..i + 1]
    # if there's a match, skip over it (i+=2 in total)
    # if there's no match, add the value to the array
    match?(pair) ? i += 1 : output << arr[i]
    i += 1
  end
  output
end
