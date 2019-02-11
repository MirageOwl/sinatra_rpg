class Job
  attr_reader :atk, :def, :int, :spd
  DEFAULT = {atk: 5, def: 5, int: 5, spd: 5}
  def initialize(stats = {})
    stats = DEFAULT.merge stats
    @atk, @def, @int, @spd = stats[:atk], stats[:def], stats[:int], stats[:spd]
  end
end

class Character
  attr_reader :name, :atk, :def, :int, :spd, :max_hp
  attr_accessor :hp

  def initialize name, job
    @name = name
    @hp = @max_hp = 10
    @atk, @def, @int, @spd = job.atk, job.def, job.int, job.spd
  end
end
