# frozen_string_literal: true

require "time"

def day_04a(arr)
  guards = {}
  times = sort_by_times(arr)
  @awake_at = nil
  @asleep_at = nil
  @current_guard_id = nil
  times.each do |string|
    if string.include?("Guard #")
      @current_guard_id = string.match(/\#\d+/)[0].tr("#", "")
      @awake_at = get_time(string)
      guards[@current_guard_id] = { sleep_times: [] } unless guards[@current_guard_id]
    elsif string.include?("wakes")
      @awake_at = get_time(string)
      sleep_duration = @awake_at.to_i - (@asleep_at.to_i)
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
  sleepiest_minute = @all_minutes.max_by { |_k, v| v }[0].to_i
  sleepiest_id = tired_guard[0].to_i
  sleepiest_minute * sleepiest_id
end

def duration_to_minute_array(start_time, end_time, minutes)
  # only count midnight hour, can just get minutes, don't include minute guard wakes up
  sleep_minutes = (start_time.strftime("%M").to_i..end_time.strftime("%M").to_i - 1)
  sleep_minutes.each do |minute|
    minutes[minute] ? minutes[minute] += 1 : minutes[minute] = 1
  end
end

def sleepiest_guard(guards)
  guards.max_by { |_k, v| v[:sleep_times].map { |h| h[:duration] }.sum }
end

def get_time(string)
  Time.parse(string[/\[(.*)\]/, 1])
end

def sort_by_times(arr)
  # sort by time stamp between []
  arr.sort_by { |l| get_time(l) }
end
