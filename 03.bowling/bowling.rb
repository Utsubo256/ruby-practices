#!/usr/bin/env ruby

score = ARGV[0].gsub(/X/, '10,0')
shots = score.split(',').map(&:to_i)
frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, index|
  if index == 9
    point += frames.slice(9..-1).flatten.sum
    break
  elsif frame.first == 10
    if frames[index+1].first == 10
      point += 20 + frames[index+2].first
    else
      point += 10 + frames[index+1].sum
    end
  elsif frame.sum == 10
    point += 10 + frames[index+1].first
  else
    point += frame.sum
  end
end

puts point
