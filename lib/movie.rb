class Actor
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def act
    'I love you, baby'
  end

  def fall_off_lader
    'Call my agent! No way!'
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shotting
    return unless actor.ready?

    actor.act
    actor.fall_off_lader
    actor.light_on_fire
    actor.act
  end
end
