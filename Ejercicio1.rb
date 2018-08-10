# Clase: Table
# Metodos:
# * max: valor maximo
# * total_average: promedio total
class Table
  def initialize(name, day1, day2, day3, day4)
    @name = name
    @day1 = day1.to_i
    @day2 = day2.to_i
    @day3 = day3.to_i
    @day4 = day4.to_i
  end

  def max_by_table
    d = [@day1, @day2, @day3, @day4]
    d_max = d.max
    d_val = d.index(d_max) + 1
    print "Mesa nombre: #{@name}, "
    print "mayor recaudación día: #{d_val}, "
    print "por un valor de: #{d_max}\n"
  end

  def average
    [@day1,@day2,@day3,@day4].sum / 4.0
  end

  def to_s
    "#{@name}: #{@day1},#{@day2},#{@day3},#{@day4}"
  end
end

def llama_tabla
  o = []
  f = File.read('casino.txt')
  f.split("\n").each do |linea|
    campos = linea.split(', ')
    o << Table.new(campos[0], campos[1], campos[2], campos[3], campos[4])
  end
  o
end
t = llama_tabla

print "Mayor recaudación por mesas\n"
t.each { |mesa| print mesa.max_by_table }

ta = t.inject(0) { |suma, mesa| suma + mesa.average }
print "Promedio de todas las mesas: #{ta / t.length}\n"
