# frozen_string_literal: true

def main
  nums = File.readlines('in/01a.txt').map { |v| v.strip.to_i }
  nums.reduce(0) { |sum, num| sum + num }
end

File.open('out/01a.txt', 'w') { |f| f.write(main) }
