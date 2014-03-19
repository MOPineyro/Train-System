class Station

  attr_reader :name, :id

  def initialize(attribute)
    @name = attribute[:name]
    @id = attribute[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      stations << Station.new({:name => name, :id => id})
    end
    stations
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_station)
    self.name == another_station.name && self.id == another_station.id
  end

end
