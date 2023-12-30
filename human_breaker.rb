class HumanBreaker < CodeBreaker
  # make guess
  include UserIO

  private

  def accept_guess
    # receive user input
    loop do
      print 'Your Guess: '
      input = gets.chomp.gsub(' ', '').split('')
      return input.map(&:upcase) if code_input_valid?(input, @colors)

      print '[Invalid Format] Format: `RRRR` or `r r r r`. Case and space insensitive. '
    end
  end

  # def guess_input_valid?(input)
  #   # check if user input is valid
  #   # valid cases: `r r R R `, ` rrrR`, `ygg b `
  #   input.length == 4 && input.all? { |char| @colors.keys.include? char.upcase }
  # end
end
