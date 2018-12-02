# frozen_string_literal: true

require_relative '../src/02b.rb'

describe 'day_02b' do
  # number of letters in common in the two strings that differ by one letter
  # (at the same position)
  it 'should return fgij' do
    arr = %w[abcde fghij klmno pqrst fguij axcye wvxyz]
    expect(day_02b(arr)).to eq('fgij')
  end
end
