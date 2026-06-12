require 'pry'
class Randomizer
  def initialize(show, count)
    show, count = sanatize_params(show, count)
    count = count.nil? ? 1 : count.to_i
    res = get_episodes(show: show, count: count)

    res.each do |r|
      puts "#{r[0]} Season #{r[1]}, Episode #{r[2]}"
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

  def get_episodes(show: nil, count: 1)
    results = []

      count.times do
      if !show.nil?
        res = []
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
        results << res
      else
        res = [sg1, spinoffs(5), spinoffs(2)].sample
        results << res
      end
    end

    results
  end

  def sanatize_params(show, count)
    if Integer(show, exception: false).nil?
      [show, count]
    else
      [count, show.to_i]
    end
  end
end

Randomizer.new(ARGV[0], ARGV[1])
