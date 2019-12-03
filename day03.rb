class Day03
  def self.run
    Part1.new.run
  end

  class Part1
    def run
      input = File.readlines('./day03.txt').map { |line| line.split(',') }
      path_a, path_b = build_paths(input)

      distances = (path_a & path_b).map { |x, y| x.abs + y.abs }.sort

      puts "Day03::Part1 answer: #{distances.first}"
    end

    def build_paths(input)
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
  end
end

Day03.run
