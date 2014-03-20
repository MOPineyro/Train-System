require './lib/line'
require './lib/station'
require './lib/stop'
require 'colorize'
require 'pg'

DB = PG.connect({:dbname => 'train_system'})


def operator_menu
  puts "s to add a station"
  puts "l to add line"
  puts "'stop' to add a stop"
  puts "x to return to main menu"
  input = gets.chomp
  case input
  when 's'
    add_station
  when 'l'
    add_line
  when 'stop'
    add_stop
  when 'x'
    menu
  else
    operator_menu
  end
  operator_menu
end

def rider_menu
  puts "Choose a line or station for more information"
  show_lines
  show_stations
  input = gets.chomp
  show_stops(input)
end

def add_station
  puts "Type your station name:"
  inputted_name = gets.chomp
  Station.create(inputted_name)
end

def show_stations
  puts "*****STATIONS*****".green
  Station.all.each {|station| puts station.name}
end

def add_line
  puts "Type your line color:"
  inputted_color = gets.chomp
  Line.create(inputted_color)
end

def show_lines
  puts "******LINES*******".green
  Line.all.each {|line| puts line.color}
end


def add_stop
  show_lines
  show_stations
  puts "Enter the station name of your stop:"
  station_name = gets.chomp
  puts "Enter the line color of your stop:"
  line_color = gets.chomp

  Stop.create(station_name, line_color)
  #create a validation for station name and line color
end

def show_stops(input)
  results = DB.exec("SELECT lines_stations.id,name,station_id,color,line_id FROM lines_stations LEFT OUTER JOIN stations ON stations.id = lines_stations.station_id LEFT OUTER JOIN lines ON lines.id = lines_stations.line_id;")
  stops = []
  display = []
  results.each do |result|
    line_color = result['color']
    station_name = result['name']
    if station_name == input
      display << line_color
    elsif line_color == input
      display << station_name
    end
  end
  puts '******************'.cyan
  puts input.magenta + ": "
  display.each {|x| puts x}
  rider_menu
end

# def show_stops

# end

def menu
  puts '                 _-====-__-======-__-========-_____-============-__'
  puts '               _(                                                 _)'
  puts '            OO(            Welcome to the Train System           )_'
  puts '           0  (_                                                   _)'
  puts '         o0     (_                                                _)'
  puts '        o         "=-___-===-_____-========-___________-===-----=""'
  puts '      .o                                _________'
  puts '     . ______          ______________  |         |      _____'.green
  puts '   _()_||__|| ________ |            |  |_________|   __||___||__'.green
  puts '  (EPICODUS | |      | |            | __Y______00_| |_         _|'.green
  puts ' /-OO----OO""="OO--OO"="OO--------OO"="OO-------OO"="OO-------OO"=P'.green
  puts '#####################################################################'.red
  puts
  puts '****************************[ENTER A KEY TO BEGIN]*********************'.blue

  selection = gets.chomp

  case selection
  when 'o'
    puts "Enter Operator password"
    operator_selection = gets.chomp
    case operator_selection
    when "epicodus" then operator_menu
    else
      puts "F*CK OFF!! ACCESS DENIED".red
      rider_menu
    end
  else
      rider_menu
  end
end

system "clear"
menu
