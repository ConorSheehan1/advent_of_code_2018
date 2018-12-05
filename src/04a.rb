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
      guards[@current_guard_id] = { sleep_times: 0 } unless guards[@current_guard_id]
    elsif string.include?("wakes")
      @awake_at = get_time(string)
      # don't include minute that guard wakes up (-60 seconds)
      sleep_duration = @awake_at.to_i - (@asleep_at.to_i - 60)
      if guards[@current_guard_id][:sleep_time] && @asleep_at
        guards[@current_guard_id][:sleep_time] += sleep_duration
      else
        guards[@current_guard_id][:sleep_time] = sleep_duration
      end
      @asleep_at = nil
    elsif string.include?("sleep")
      @asleep_at = get_time(string)
    end
  end
  # 2441 wrong
  # 2411 too low
  guards.max_by {|k, v| v[:sleep_time] }[0]
end

def get_most_sleep_guard(ordered_guard_sleep_times)
end

def get_time(string)
  Time.parse(string[/\[(.*)\]/, 1])
end

def sort_by_times(arr)
  # sort by time stamp between []
  arr.sort_by{|l| get_time(l)}
end
