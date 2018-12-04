# frozen_string_literal: true

module Helpers
  class SilenceThorWarnings < StringIO
    def puts(string)
      super unless string.start_with?("[WARNING]  Attempted to create command")
    end
  end

  def silence_thor_warnings
    $stdout = SilenceThorWarnings.new
  end

  def enable_thor_warnings
    $stdout = STDOUT
  end

  # https://github.com/erikhuda/thor/blob/577fcc457805451eb5e0c15fc382dfb65a8af224/spec/helper.rb#L49
  # https://bokstuff.com/testing-thor-command-lines-with-rspec/
  def capture(stream)
    begin
      stream = stream.to_s
      eval("$#{stream} = StringIO.new", binding, __FILE__, __LINE__)
      yield
      result = eval("$#{stream}", binding, __FILE__, __LINE__).string
    ensure
      eval("$#{stream} = #{stream.upcase}", binding, __FILE__, __LINE__)
    end
    result
  end

  # https://stackoverflow.com/questions/9236264/how-to-disable-warning-for-redefining-a-constant-when-loading-a-file
  def silence_warnings(&_block)
    warn_level = $VERBOSE
    $VERBOSE = nil
    result = yield
    $VERBOSE = warn_level
    result
  end
end
