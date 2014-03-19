class Stop

  attr_reader :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes[:station_id]
    @line_id = attributes[:line_id]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM lines_stations;")
    stops = []
    results.each do |result|
      station_id = result['station_id'].to_i
      line_id = result['line_id'].to_i
      id = result['id'].to_i
      stops << Stop.new({:station_id => station_id, :line_id => line_id, :id => id})
    end
    stops
  end

  def save
    result = DB.exec("INSERT INTO lines_stations (station_id, line_id) VALUES ('#{@station_id}', '#{@line_id}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_stop)
    self.station_id == another_stop.station_id && self.line_id == another_stop.line_id && self.id == another_stop.id
  end


end
