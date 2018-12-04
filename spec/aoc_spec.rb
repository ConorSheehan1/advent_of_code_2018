# frozen_string_literal: true

# load runs in dir rspec is called in, so no ../ needed
load "aoc"

describe Aoc do
  before do
    silence_thor_warnings
  end
  describe "with_output" do
    xit "should require the source file for the day" do
      expect(subject.send(:with_output, "test"))
    end
    xit "should read the input file for part A of the day be default"
    xit "should read a specified input"
  end
  describe "spec" do
    it "should call rspec" do
      spec_str = "bundle exec rspec spec/test_spec.rb"
      expect_any_instance_of(Kernel).to receive(:system).with(spec_str)
      subject.spec("test")
    end
  end
  describe "to_screen" do
    it "should print the output to the screen" do
      klass = subject.class
      allow_any_instance_of(klass).to receive(:with_output).and_yield("test")
      output = capture(:stdout) { subject.to_screen("test") }
      expect(output).to eq("test\n")
    end
  end
  describe "to_file" do
    xit "should write the output to a file"
  end
end
