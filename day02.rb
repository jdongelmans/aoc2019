#!/usr/bin/ruby

class Day02
  def self.run
    Part1.new.run
    Part2.new.run
  end

  def self.calculate(input, current_position = -1)
    group = input[(current_position += 1)..current_position += 3]

    case group[0]
    when 1
      input[group[3]] = input[group[1]] + input[group[2]]
    when 2
      input[group[3]] = input[group[1]] * input[group[2]]
    when 99
      return input
    end

    calculate(input, current_position)
  end

  class Part1
    def run
      input = File.read('./day02.txt').split(',').map(&:to_i)
      input[1], input[2] = 12, 2

      puts "Day02::Part1 answer: #{Day02.calculate(input)[0]}"
    end
  end

  class Part2
    def run
      input = File.read('./day02.txt').split(',').map(&:to_i)

      (0..99).each do |noun|
        (0..99).each do |verb|
          current_input                      = input.dup
          current_input[1], current_input[2] = noun, verb

          result = Day02.calculate(current_input)[0]
          
          puts "Day02::Part2 answer: #{100 * noun + verb}" and return if result == 19690720
        end
      end
    end
  end
end

Day02.run
