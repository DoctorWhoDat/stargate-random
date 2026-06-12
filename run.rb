require 'pry'
class Randomizer
  def initialize
    res = [sg1, spinoffs(5), spinoffs(2)].sample
    puts "#{res[0]} Season #{res[1]}, Episode #{res[2]}"
  end

  def sg1
    season = rand(1..10)
    episode = season <=7 ? rand(1..22) : rand(1..20)

    ['SG-1', season, episode]
  end

  def spinoffs(max)
    show = max == 2 ? 'Universe' : 'Atlantis'

    [show, rand(1..max), rand(1..20)]
  end

  def rand(range)
    range.to_a.sample
  end
end

Randomizer.new