# frozen_string_literal: true

require "ostruct"
require "set"

def day_03a(arr)
  coords = arr.map do |v|
    # convert string to hash
    coords = str_coords_to_hash(v)
    # convert hash to array of open struct
    xywh_to_arr(coords)
  end
  overlap = get_overlap(coords)
  overlap.count
end

# @param [Array] of coordinates (nested array)
# @return [Set] coordinates that overlap
def get_overlap(coords)
  coord_hash = {}
  coords.each do |coord_list|
    coord_list.each do |coord|
      coord_hash[coord] ? coord_hash[coord] += 1 : coord_hash[coord] = 1
    end
  end
  overlap = Set.new
  coord_hash.map { |k, v| overlap << k if v > 1 }
  overlap
end

# format: #123 @ 3,2: 5x4
# format: #id @ x,y (bottom left), width, height
# @param [String] string
# @return [Hash]
def str_coords_to_hash(string)
  id, rest = string.split("@").map(&:strip)
  xy, wh = rest.split(" ").map(&:strip)
  x, y = xy.split(",").map(&:strip).map(&:to_i)
  w, h = wh.split("x").map(&:strip).map(&:to_i)
  { id: id, x: x, y: y, width: w, height: h }
end

# @param [Hash] coords
# @return [Array] of all coordinates in rectangle
def xywh_to_arr(coords)
  arr = []
  coords[:width].times do |x|
    coords[:height].times do |y|
      arr << "#{coords[:x] + x},#{coords[:y] + y}"
    end
  end
  arr
end
