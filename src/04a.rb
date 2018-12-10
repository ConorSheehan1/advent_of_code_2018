# frozen_string_literal: true

require "time"

def day_04a(arr)
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
  tired_guard = sleepiest_guard(guards)
  @all_minutes = {}
  tired_guard[1][:sleep_times].map do |sleeps|
    duration_to_minute_array(sleeps[:start], sleeps[:end], @all_minutes)
  end
  sleepiest_minute = @all_minutes.max_by {|k,v| v}[0].to_i
  sleepiest_id = tired_guard[0].to_i
  sleepiest_minute * sleepiest_id
end

def duration_to_minute_array(start_time, end_time, minutes)
  # minutes = {}
  while start_time <= end_time
    minute = start_time.strftime("%M")
    minutes[minute] ? minutes[minute] += 1 : minutes[minute] = 1
    # add 60 seconds (1 minute)
    start_time += 60
  end
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
