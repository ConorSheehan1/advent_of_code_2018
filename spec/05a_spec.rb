# frozen_string_literal: true

require_relative "../src/05a.rb"

describe "get_polymer" do
  it "should remove all characters next to their uppercase counterpart" do
    expect(get_polymer("dabAcCaCBAcCcaDA".scan(/\w/))).to eq("dabCBAcaDA")
  end
end


describe "day_05a" do
  it "should return the length of the polymer" do
    expect(day_05a(["dabAcCaCBAcCcaDA"])).to eq(10)
  end
end
