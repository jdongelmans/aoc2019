class Day01
  def self.run
    Part1.new.run
    Part2.new.run
  end
  
  class Part1
    def run
      inputs = File.read('./day01.txt').split("\n").map(&:to_i)
      result = inputs.map { |input| (input / 3).floor - 2 }.inject(&:+)

      puts "answer part1: #{result}"
    end
  end
  
  class Part2
    def run
      inputs = File.read('./day01.txt').split("\n").map(&:to_i)
      result = inputs.map { |input| calculate(input) }.inject(&:+)

      puts "answer part2: #{result}"
    end
    
    def calculate(input, total = 0)
      result = (input / 3).floor - 2

      return total if result <= 0

      total += result
      calculate(result, total)
    end
  end
end

Day01.run
