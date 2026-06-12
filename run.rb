require 'pry'
class Randomizer
  def initialize(show: nil)
    if !show.nil?
      res = nil
      show = show.downcase

      case
      when show.start_with?('s')
        res = sg1
      when show.start_with?('a')
        res = spinoffs(5)
      when show.start_with?('u')
        res = spinoffs(2)
      else
        res = ['Something wrong',nil,nil]
      end
      puts "#{res[0]} Season #{res[1]}, Episode #{res[2]}"
    else
      res = [sg1, spinoffs(5), spinoffs(2)].sample
      puts "#{res[0]} Season #{res[1]}, Episode #{res[2]}"
    end
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

shows = ['SG1', 'Atlantis', 'Universe']

if (!ARGV.nil? && !ARGV.empty?) && shows.include?(ARGV[0])
  Randomizer.new show: ARGV[0]
else
  cnt = ARGV[0]&.to_i || 1
  cnt.times do
    Randomizer.new
  end
end
