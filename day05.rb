#!/usr/bin/ruby

class Day05
  def self.run
    Part1.new.run
    Part2.new.run
  end

  def self.calculate(input, current_position)
    case input[(current_position += 1)]
    when 3, 4
      number_of_parameters = 1
    else
      number_of_parameters = 3
    end

    group = input[current_position..(current_position += number_of_parameters)]

    instruction = group[0].to_s.rjust(5, '0')
    opcode      = instruction[3..-1].to_i

    param_1_mode = (instruction[2] || 0).to_i
    value_1      = param_1_mode == 0 ? input[group[1]] : group[1]

    unless [3, 4].include?(opcode)
      param_2_mode = (instruction[1] || 0).to_i
      value_2      = param_2_mode == 0 ? input[group[2]] : group[2]
      param_3_mode = (instruction[0] || 0).to_i
      value_3      = param_3_mode == 0 ? input[group[3]] : group[3]
    end

    case opcode
    when 1
      input[group[3]] = value_1 + value_2
    when 2
      input[group[3]] = value_1 * value_2
    when 3
      puts "Input: "
      input[group[1]] = gets.chomp.to_i
    when 4
      puts "Output for opcode 4: #{input[group[1]]}"
    when 99
      return input
    end

    calculate(input, current_position)
  end

  class Part1
    def run
      input = File.read('./day05.txt').split(',').map(&:to_i)

      Day05.calculate(input, -1)
    end
  end

  class Part2
    def run
    end
  end
end

Day05.run
