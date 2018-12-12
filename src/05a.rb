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
def is_upper?(char)
  /[A-Z]/.match(char)
end

# @param [String] char
# @return [Boolean]
def is_lower?(char)
  /[a-z]/.match(char)
end

# @param [Array] arr
# @return [Boolean] array contains uppercase and lower case version of la etter
def has_match?(arr)
  small = arr.select { |v| is_lower?(v) }.first
  big = arr.select { |v| is_upper?(v) }.first
  small && big && (small.upcase == big)
end

# @param [Array] arr
# @return [Array]
def collapse_matches(arr)
  output = []
  i = 0
  while i < arr.length
    pair = arr[i..i + 1]
    if has_match?(pair)
      i += 2
    else
      output << arr[i]
      i += 1
    end
  end
  output
end
