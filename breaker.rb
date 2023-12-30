# Breaker default: computer. If human breaker, use HumanBreaker class
class CodeBreaker
  attr_reader :guesses

  def initialize(colors)
    @colors = colors
    @guesses = []
  end

  def make_guess
    # return array e.g. ["R", "R", "R", "R"]
    new_guess = accept_guess # either from computer or human
    @guesses.push(new_guess.map { |symbol| @colors[symbol] })
    new_guess
  end

  def guess
    guesses[-1]
  end

  def previous_guesses
    guesses[...-1]
  end

  private

  def accept_guess
    # receive computer guess
    puts 'computer guess:'
    p(4.times.map { @colors.keys.sample })
  end
end
