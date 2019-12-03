class Day03
  def self.run
    Part1.new.run
    Part2.new.run
  end

  def self.build_paths(input)
    input.map do |path|
      path.each_with_object([[0, 0]]) do |step, array|
        moves = step[1..-1].to_i
        case step[0]
        when 'R'
          moves.times { array << [array.last[0], array.last[1] += 1] }
        when 'L'
          moves.times { array << [array.last[0], array.last[1] -= 1] }
        when 'D'
          moves.times { array << [array.last[0] -= 1, array.last[1]] }
        when 'U'
          moves.times { array << [array.last[0] += 1, array.last[1]] }
        end
      end
    end
  end

  class Part1
    def run
      input = File.readlines('./day03.txt').map { |line| line.split(',') }
      path_a, path_b = Day03.build_paths(input)

      distances = (path_a & path_b).map { |x, y| x.abs + y.abs }.sort

      puts "Day03::Part1 answer: #{distances.first}"
    end
  end

  class Part2
    def run
      input = File.readlines('./day03.txt').map { |line| line.split(',') }
      path_a, path_b = Day03.build_paths(input)

      distances = (path_a & path_b).map { |intersect| path_a.index(intersect) + path_b.index(intersect) }.sort

      puts "Day03::Part2 answer: #{distances.first + 2}" # +2 to correct for index 'off by one error'
    end
  end
end

Day03.run
