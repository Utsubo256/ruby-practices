#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0].gsub(/X/, '10,0')
shots = score.split(',').map(&:to_i)
frames = shots.each_slice(2).to_a

STRIKE = 10

point = 0
frames.each_with_index do |frame, index|
  point +=
    if index == 9
      frames.slice(9..-1).flatten.sum
    elsif frame.first == STRIKE
      if frames[index + 1].first == STRIKE
        STRIKE + frames[index + 1].first + frames[index + 2].first
      else
        STRIKE + frames[index + 1].sum
      end
    elsif frame.sum == 10
      frame.sum + frames[index + 1].first
    else
      frame.sum
    end
  break if index == 9
end

puts point
