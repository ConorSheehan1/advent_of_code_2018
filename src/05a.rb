# frozen_string_literal: true

def day_05a(arr)
  string = arr[0]
  get_polymer(string.scan(/\w/)).length
end

def get_polymer(chars)
  old_chars = chars
  new_chars = collapse_matches(old_chars)
  while old_chars != new_chars
    old_chars = new_chars
    new_chars = collapse_matches(old_chars)
  end
  new_chars.join("")
end

def is_upper?(char)
  /[A-Z]/.match(char)
end

def is_lower?(char)
  /[a-z]/.match(char)
end

def has_match?(arr)
  small = arr.select {|v| is_lower?(v)}.first
  big = arr.select {|v| is_upper?(v)}.first
  small && big && (small.upcase == big)
end

def collapse_matches(arr)
  output = []
  # arr.each_cons(2) do |first, second|
  #   all_chars = [first, second]
  #   next if has_match?(all_chars)
  #   output << first
  # end
  # # last 2 chars case
  # all_chars = arr[-2..-1]
  # output << all_chars unless has_match?(all_chars)

  i = 0
  while i < arr.length
    pair = arr[i..i+1]
    if has_match?(pair)
      i += 2
    else
      output << arr[i]
      i += 1
    end
  end
  output
end
