# frozen_string_literal: true

require_relative '../src/01b.rb'

describe '01b' do
  it 'should return 0' do
    expect(main(%w[+1 -1])).to eq(0)
  end
  it 'should return 10' do
    expect(main(%w[+3 +3 +4 -2 -4])).to eq(10)
  end
  it 'should return 5' do
    expect(main(%w[-6 +3 +8 +5 -6])).to eq(5)
  end
  it 'should return 14' do
    expect(main(%w[+7 +7 -2 -7 -4])).to eq(14)
  end
end
