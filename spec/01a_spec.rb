# frozen_string_literal: true

require_relative '../src/01a.rb'

describe '01a' do
  it 'should return 10' do
    expect(main(%w[+5 +4 +1])).to eq(10)
  end
end
