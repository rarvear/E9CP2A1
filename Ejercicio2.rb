# frozen_string_literal: true

# Clase: Course
# Metodos:

# Importar libreria para manipulacion de Fechas
require 'Date'

class Course
  def initialize(name, start_date, end_date)
    @name = name
    begin
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
    rescue ArgumentError => e
      print "Ocurrió el siguiente error #{e}"
    end
  end

  def start_before_at?(date)
    if date >= Date.parse('01/01/2019')
      raise 'La fecha ingresada es incorrecta'
    else
      @start_date < date
    end
  end

  def end_after_at?(date)
    raise 'La fecha ingresada es incorrecta' if date >= Date.parse('01/01/2019')
    @end_date > date
  end

  def to_s
    "#{@name}: #{@start_date},#{@end_date}"
  end
end

def llama_curso
  o = []
  f = File.read('cursos.txt')
  f.split("\n").each do |linea|
    campos = linea.split(', ')
    o << Course.new(campos[0], campos[1], campos[2])
  end
  o
end
t = llama_curso
ahora = Date.today
futura = Date.today + (2 * 365)
print "#{t}\n"
print "Prueba ahora\n"
print "#{t.first.start_before_at?(ahora)}\n\n"
print "Prueba futura\n"
begin
  print t.first.start_before_at? futura
rescue StandardError => cuek
  print "#{cuek}\n"
end

print "Prueba fecha de término\n"
print "#{t.first.end_after_at?(ahora)}\n\n"