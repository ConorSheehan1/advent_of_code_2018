# frozen_string_literal: true

require_relative "../src/03a.rb"

describe "day_03a" do
  it "should get the overlap" do
    arr = [
      "#1 @ 1,3: 4x4",
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2"
    ]
    expect(day_03a(arr)).to eq(4)
  end
end
