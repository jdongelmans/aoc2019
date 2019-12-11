#!/usr/bin/ruby

class Day08
  DIMENSIONS = { width: 25, height: 6 }
  GRID_SIZE  = DIMENSIONS[:width] * DIMENSIONS[:height]

  def self.run
    Part1.new.run
    Part2.new.run
  end

  class Part1
    def run
      input  = File.read('./day08.txt').chomp.chars.map(&:to_i)
      layers = input.each_slice(GRID_SIZE).with_object([]) { |i, layer| layer << i }

      layer_with_least_0 = layers.sort_by { |layer| layer.count(0) }.first
      count_1            = layer_with_least_0.count(1)
      count_2            = layer_with_least_0.count(2)

      puts "Day08::Part1 answer: amount of 1's: #{count_1}, amount of 2's: #{count_2}. Total: #{count_1 * count_2}"
    end
  end

  class Part2
    def run
      input      = File.read('./day08.txt').chomp.chars.map(&:to_i)
      layers     = input.each_slice(GRID_SIZE).with_object([]) { |i, layer| layer << i }
      layer_size = layers.first.count

      pixel_arrays = layer_size.times.map do |i|
        layers.map { |layer| layer[i] }
      end

      puts "Day08::Part2 answer:"
      bitmap = pixel_arrays.map { |pixel_array| determine_value(pixel_array) }
      bitmap.each_slice(DIMENSIONS[:width]) do |line|
        puts line.join
      end
    end

    def determine_value(pixel_array)
      # 0 is black, 1 is white, and 2 is transparent.
      pixel_array.each do |pixel|
        next if pixel == 2
        return '*' if pixel == 1
        return ' ' if pixel == 0
      end
    end
  end
end

Day08.run
