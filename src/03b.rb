# frozen_string_literal: true

require_relative "./03a"

def day_03b(arr)
  coords = []
  arr.each do |coord_string|
    # convert string to hash
    id_hash = str_coords_to_hash(coord_string)
    # add full coordinates to hash
    id_hash[:coords] = xywh_to_arr(id_hash)
    coords << id_hash
  end
  overlap = get_3boverlap(coords)
  coords.each do |coord_with_id|
    # [] & [] get intersection of arrays
    # return id where there is no overlap
    return coord_with_id[:id] if (coord_with_id[:coords] & overlap).empty?
  end
end

def get_3boverlap(coords)
  coord_hash = {}
  coords.each do |coord_with_id|
    coord_with_id[:coords].each do |coord|
      coord_hash[coord] ? coord_hash[coord] += 1 : coord_hash[coord] = 1
    end
  end
  # coord_hash.select {|k,v| k if v > 1}.uniq.count
  overlap = Set.new
  coord_hash.map { |k, v| overlap << k if v > 1 }
  overlap.to_a
end
