# frozen_string_literal: true

# !/usr/bin/env ruby

score = ARGV[0].gsub(/X/, '10,0')
shots = score.split(',').map(&:to_i)
frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, index|
  point +=
    if index == 9
      frames.slice(9..-1).flatten.sum
      break
    elsif frame.first == 10
      if frames[index + 1].first == 10
        20 + frames[index + 2].first
      else
        10 + frames[index + 1].sum
      end
    elsif frame.sum == 10
      10 + frames[index + 1].first
    else
      frame.sum
    end
end

puts point
