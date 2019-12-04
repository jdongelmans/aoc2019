#!/usr/bin/ruby

class Day04
  def self.run
    Part1.new.run
    Part2.new.run
  end

  def self.double_digit?(i)
    i.to_s.squeeze!
  end

  def self.never_decreasing?(i)
    i.digits.sort.join.to_i == i
  end

  def self.not_in_larger_group?(i)
    double_digit_groups = i.to_s.chars.each_cons(2).with_object([]) { |(a, b), groups| groups << a + b if a == b }
    double_digit_groups.any? { |group| double_digit_groups.count(group) == 1 }
  end

  class Part1
    def run
      input = (246515..739105)
      count = 0

      input.each do |i|
        count += 1 if Day04.double_digit?(i) && Day04.never_decreasing?(i)
      end

      puts "Day04::Part1 answer: #{count}"
    end
  end

  class Part2
    def run
      input = (246515..739105)
      count = 0

      input.each do |i|
        count += 1 if Day04.double_digit?(i) && Day04.never_decreasing?(i) && Day04.not_in_larger_group?(i)
      end

      puts "Day04::Part2 answer: #{count}"
    end
  end
end

Day04.run
