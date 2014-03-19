class Line

  attr_reader :color, :id

  def initialize(attributes)
    @color = attributes[:color]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM lines;")
    lines = []
    results.each do |result|
      color = result['color']
      id = result['id'].to_i
      lines << Line.new({:color => color, :id => id})
    end
    lines
  end

  def self.create(color)
    new_line = Line.new({:color => color})
    new_line.save
    new_line
  end

  def save
    results = DB.exec("INSERT INTO lines (color) VALUES ('#{@color}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_line)
    self.color == another_line.color && self.id == another_line.id
  end

end
