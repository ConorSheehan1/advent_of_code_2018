# frozen_string_literal: true

require "time"
require_relative "./04a"

def day_04b(arr)
  guards = {}
  times = sort_by_times(arr)
  @awake_at = nil
  @asleep_at = nil
  @current_guard_id = nil
  times.each do |string|
    if string.include?("Guard #")
      @current_guard_id = string.match(/\#\d+/)[0].tr("#", "")
      @awake_at = get_time(string)
      guards[@current_guard_id] = { sleep_times: {} } unless guards[@current_guard_id]
    elsif string.include?("wakes")
      @awake_at = get_time(string)
      if guards[@current_guard_id] && @asleep_at
        duration_to_minute_array(@asleep_at, @awake_at, guards[@current_guard_id][:sleep_times])
      end
      @asleep_at = nil
    elsif string.include?("sleep")
      @asleep_at = get_time(string)
    end
  end
  tired_guard = sleepies_guard_strategy2(guards)
  sleepiest_id = tired_guard.first[0].to_i
  sleepiest_minute = tired_guard.first[1][:sleep_times].max_by { |_k, v| v }[0].to_i
  sleepiest_minute * sleepiest_id
end

def sleepies_guard_strategy2(guards)
  current_max = [guards.first].to_h
  guards.each do |id, sleep_hash|
    max_sleep = current_max.first[1][:sleep_times].values.max || 0
    new_max_sleep = sleep_hash[:sleep_times].values.max || 0
    current_max = [[id, sleep_hash]].to_h if new_max_sleep > max_sleep
  end
  current_max
end
