# frozen_string_literal: true

require_relative "../src/02a.rb"

describe "02a" do
  describe "checksum" do
    it "should be 12" do
      arr = %w[abcdef bababc abbcde abcccd aabcdd abcdee ababab]
      expect(day_02a(arr)).to eq(12)
    end
  end
end
