# frozen_string_literal: true
require 'ostruct'
require 'set'


def day_03a(arr)
  coords = arr.map do |v| 
    # convert string to hash
    coords = str_coords_to_hash(v)
    # convert hash to array of open struct
    arr_of_coords = xywh_to_arr(coords)
    # convert back to hash with open struct as key to count duplicates
  end
  coord_hash = {}
  coords.each do |coord_list|
    coord_list.each do |coord|
      if coord_hash[coord]
        coord_hash[coord] += 1
      else
        coord_hash[coord] = 1
      end
    end
  end
  # coord_hash.select {|k,v| k if v > 1}.uniq.count
  overlap = Set.new
  coord_hash.map do |k,v|
    overlap << k if v > 1
  end
  overlap.count
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
  {id: id, x: x, y:y, width:w, height:h}
end

# @param [Hash] coords
# @return [Array] of all coordinates in rectangle
def xywh_to_arr(coords)
  arr = []
  coords[:width].times do |x|
    coords[:height].times do |y|
      # arr << [coords[:x] + x, coords[:y] + y]
      # arr << OpenStruct.new(x: coords[:x] + x, y: coords[:y] + y)
      arr << "#{coords[:x] + x},#{coords[:y] + y}"
    end
  end
  arr
end

# # @return [Hash] count of each coordinate
# def arr_coords_to_hash(arr)
#   coord_hash = {}
#   arr.each do |xy_struct|
#     if coord_hash[xy_struct]
#       coord_hash[xy_struct] += 1
#     else
#       coord_hash[xy_struct] = 1
#     end
#   end
#   coord_hash
# end

# # @param [Hash] coords
# # @return array with coordinates for bottom left and top right of rectangle [[x1,y1], [x2,y2]]
# def xywh_to_bl_tr(coords)
#   bl = [coords[:x], coords[:y]]
#   tr = [coords[:x] + coords[:width], coords[:y], coords[:height]]
# end

# def get_overlap(arr1, arr2)

# end
