# frozen_string_literal: true

# require "date"
require "time"
require "byebug"

def day_04a(arr)
  byebug
  guards = {}
  times = sort_by_times(arr)
  @awake_at, @asleep_at, @current_guard_id = nil, nil, nil
  times.each do |string|
    if string.include?("Guard #")
      @current_guard_id = string.match(/\#\d+/)[0].tr("#", "")
      @awake_at = get_time(string)
      guards[@current_guard_id] = { sleep_times: [] } unless guards[@current_guard_id]
    elsif string.include?("wakes")
      @awake_at = get_time(string)
      # don't include minute that guard wakes up (-60 seconds)
      sleep_duration = @awake_at.to_i - (@asleep_at.to_i - 60)
      if guards[@current_guard_id][:sleep_times] && @asleep_at
        guards[@current_guard_id][:sleep_times] << {
          start: @asleep_at,
          end: @awake_at,
          duration: sleep_duration
        }
      end
      @asleep_at = nil
    elsif string.include?("sleep")
      @asleep_at = get_time(string)
    end
  end
  # 2441 wrong
  # 2411 too low
  sleepiest_guard(guards)
  # longest_sleep = sleepiest_guard[1][:sleep_times].max_by {|h| h[:duration]}
  # most_common_sleep_time = 

end

def sleepiest_guard(guards)
  guards.max_by {|k, v| v[:sleep_times].map {|h| h[:duration]}.sum }
end

def get_time(string)
  Time.parse(string[/\[(.*)\]/, 1])
end

def sort_by_times(arr)
  # sort by time stamp between []
  arr.sort_by{|l| get_time(l)}
end
