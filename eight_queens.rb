class EightQueens

  def initialize(n)
    @grid = Array.new(n) { Array.new(n) }
    @solutions = Hash.new
  end


  def safe?(pos)

  end

  def display
    @grid.each { |row| puts row }
  end
end
