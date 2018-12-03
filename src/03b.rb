# frozen_string_literal: true

require_relative "./03a"

def day_03b(arr)
  coords = arr.map do |v| 
    # convert string to hash
    coords = str_coords_to_hash(v)
    # add full coordinates to hash
    coords[:coords] = xywh_to_arr(coords)
  end
end
