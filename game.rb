require_relative 'pretty'
require_relative 'breaker'
require_relative 'maker'
require_relative 'helper'
require_relative 'human_breaker'
require_relative 'human_maker'

# Where the game takes place
class Game
  include PrettyPrint
  include UserIO
  GUESSES_ALLOWED = 12
  CODE_PEGS = { 'R' => 'red', 'B' => 'blue', 'Y' => 'yellow', 'G' => 'green', 'V' => 'violet', 'P' => 'pink' }.freeze

  def initialize
    @winner = nil   # Will be either the @code_breaker or @code_maker
    @round = 1      # Increment until all guesses are used
    @is_gameover = false
    pick_side
  end

  def start
    # Uncomment the next line if you want to see the secrets
    print 'The secret code is: '
    print_colored @code_maker.reveal_secret(true)

    while @round <= GUESSES_ALLOWED
      print "\n---- Guess #{@round} / #{GUESSES_ALLOWED} ---- "
      gets

      guess = @code_breaker.make_guess

      # check, if not right, give clue
      if @code_maker.match?(guess)
        puts 'Yes! You\'ve guessed it. '
        @winner = @code_breaker
        break
      else
        print 'clue: '
        print_colored @code_maker.give_clue(guess)
        @round += 1
      end
    end

    @is_gameover = true
    print 'Game is ended. The secret code is: '
    print_colored @code_maker.reveal_secret(@is_gameover)
    print "\nWinner is: "
    puts @winner ? 'code breaker' : 'code maker'
  end

  private

  def pick_side
    # ask user whether they want to be the creator of the secret code or the guesser
    user = get_side # '1': codebreaker  '2': codemaker
    if user == '1' # user is codebreaker, computer is codemaker
      @code_breaker = HumanBreaker.new(CODE_PEGS)
      @code_maker = CodeMaker.new(CODE_PEGS)
    else
      @code_breaker = CodeBreaker.new(CODE_PEGS)
      @code_maker = HumanMaker.new(CODE_PEGS)
    end
  end
end

g = Game.new
g.start
