# frozen_string_literal: true

require_relative "../src/03b.rb"

describe "day_03b" do
  it "should find the id with no overlap" do
    arr = ["#1 @ 1,3: 4x4", "#2 @ 3,1: 4x4", "#3 @ 5,5: 2x2"]
    expect(day_03b(arr)).to eq("#3")
  end
end
