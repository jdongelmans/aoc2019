#!/usr/bin/ruby

class Day05
  def self.run
    Part1.new.run
    Part2.new.run
  end

  def self.calculate(input, current_position = 0)
    instruction = input[current_position].to_s.rjust(5, '0')
    opcode      = instruction[3..-1].to_i

    case opcode
    when 3, 4
      number_of_parameters = 1
    when 99
      number_of_parameters = 0
    else
      number_of_parameters = 3
    end

    return input if opcode == 99

    group = input[current_position..(current_position += number_of_parameters)]

    param_1_mode = (instruction[2] || 0).to_i
    value_1      = param_1_mode == 0 ? input[group[1]] : group[1]

    if number_of_parameters > 1
      param_2_mode = (instruction[1] || 0).to_i
      value_2      = param_2_mode == 0 ? input[group[2]] : group[2]
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
      puts "Output for opcode 4: #{value_1}"
    when 5
      current_position = value_2 if value_1 != 0
    when 6
      current_position = value_2 if value_1 == 0
    when 7
      input[group[3]] = (value_1 < value_2) ? 1 : 0
    when 8
      input[group[3]] = (value_1 == value_2) ? 1 : 0
    else
      raise "Invalid opcode: #{opcode}"
    end

    current_position += 1 unless [5, 6].include?(opcode)
    calculate(input, current_position)
  end

  class Part1
    def run
      input = File.read('./day05.txt').split(',').map(&:to_i)
      Day05.calculate(input)
    end
  end

  class Part2
    def run
      input = File.read('./day05.txt').split(',').map(&:to_i)
      Day05.calculate(input)
    end
  end
end

Day05.run
