class EightQueens
  attr_accessor :grid

  def initialize(n)
    @grid = Array.new(n) { Array.new(n) { 0 } }
    @solutions = []
  end

  def safe?(row, col)
    (0..@grid.length - 1).each do |i|
      return false if @grid[row][i] == 1 || @grid[i][col] == 1
    end
    @grid.each_index do |i|
      @grid[i].each_index do |j|
        return false if i + j == row + col && @grid[i][j] == 1
        return false if i - j == row - col && @grid[i][j] == 1
      end
    end
    true
  end

  def solve(row = 0)
    if row == @grid.length
      res = []
      @grid.each { |r| res << r.dup }
      @solutions << res
      return false
    end
    @grid[row].each_index do |col|
      next if !safe?(row, col)
      @grid[row][col] = 1
      return true if solve(row + 1)
      @grid[row][col] = 0
    end
    false
  end

  def display
    solve
    @solutions.each_with_index do |solution, idx|
      puts "SOLUTION: #{idx + 1}"
      solution.each { |sl| puts sl.to_s }
      puts "\n"
    end
    "END"
  end

end

if $PROGRAM_NAME == __FILE__
  q = EightQueens.new(8)
  q.display
end
