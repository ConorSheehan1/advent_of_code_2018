# frozen_string_literal: true

require "time"

def day_04a(arr)
  times = sort_by_times(arr)
  guards = parse_sleep_times(times)
  tired_guard = sleepiest_guard(guards)
  @all_minutes = {}
  tired_guard[1][:sleep_times].map do |sleeps|
    duration_to_minute_array(sleeps[:start], sleeps[:end], @all_minutes)
  end
  sleepiest_minute = @all_minutes.max_by { |_k, v| v }[0].to_i
  sleepiest_id = tired_guard[0].to_i
  sleepiest_minute * sleepiest_id
end

# refactor to yield to block so it can be used in part b?
def parse_sleep_times(ordered_times)
  guards = {}
  @awake_at = nil
  @asleep_at = nil
  @current_id = nil
  ordered_times.each do |string|
    if string.include?("Guard #")
      @current_id = string.match(/\#\d+/)[0].tr("#", "")
      @awake_at = get_time(string)
      guards[@current_id] = { sleep_times: [] } unless guards[@current_id]
    elsif string.include?("wakes")
      @awake_at = get_time(string)
      if guards[@current_id][:sleep_times] && @asleep_at
        guards[@current_id][:sleep_times] << {
          start: @asleep_at,
          end: @awake_at
        }
      end
      @asleep_at = nil
    elsif string.include?("sleep")
      @asleep_at = get_time(string)
    end
  end
  guards
end

def duration_to_minute_array(start_time, end_time, minutes)
  # only count midnight hour, can just get minutes,
  # don't include minute guard wakes up
  start_minute, end_minute = [start_time, end_time].map do |v|
    v.strftime("%M").to_i
  end
  sleep_minutes = (start_minute..end_minute - 1)
  sleep_minutes.each do |minute|
    minutes[minute] ? minutes[minute] += 1 : minutes[minute] = 1
  end
end

def sleepiest_guard(guards)
  guards.max_by do |_k, v|
    v[:sleep_times].map do |h|
      h[:end] - (h[:start] - 60)
    end.sum
  end
end

def get_time(string)
  Time.parse(string[/\[(.*)\]/, 1])
end

def sort_by_times(arr)
  # sort by time stamp between []
  arr.sort_by { |l| get_time(l) }
end
