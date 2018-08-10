

class Roulette
  
  def initialize(apuesta)
  @apuesta = apuesta
  end
  
  def play
  	r = (1..10).to_a
  	@azar = r.shuffle[0]
    save
  	@azar == @apuesta
  end

  def save
    File.open('roulette_history.txt', 'a') { |x| x.puts @azar }
    File.open('winners.txt', 'a') { |x| x.puts @apuesta if @apuesta == @azar }
  end

  def lucky
  	lines = File.read('roulette_history.txt')
    data = lines.split("\n")
    h = {}
    i = data.uniq.count
    i.times do |data|

    end

    print h

    	
    end
  
end


juega = Roulette.new(2)

# print juega.play
juega.lucky
