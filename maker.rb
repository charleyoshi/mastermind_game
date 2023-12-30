# Default: computer maker. If human, use HumanMaker.
class CodeMaker
  attr_accessor :secret

  def initialize(colors)
    @colors = colors
    @secret = 4.times.map { colors.values.sample }
    @code_pegs = [] # values either 'C' (coloured) or 'W' (white)
  end

  def reveal_secret(is_gameover)
    # return ["red", "blue", "red", "blue"] or nil
    @secret if is_gameover
  end

  def give_clue(guess)
    @code_pegs = []
    compare_codes(guess)
    # puts "code pegs: #{@code_pegs}"
    @code_pegs
  end

  def match?(guess)
    guess.map.with_index { |symbol, i| @colors[symbol] == @secret[i] }.all?
  end

  private

  def compare_codes(guess)
    checked = check_right_color_right_position(guess)
    check_right_color_wrong_position(checked, guess)
  end

  def check_right_color_right_position(guess)
    checked = [false] * 4
    @secret.each_with_index do |pin, i|
      if pin == @colors[guess[i]]
        @code_pegs.push 'C'
        checked[i] = true
      end
    end
    checked
  end

  def check_right_color_wrong_position(checked, guess)
    # puts 'Check right color wrong position, checked, guess'
    # # p checked # [false, false, false, false]
    # # p guess   # ["B", "B", "P", "P"]
    secret_remain = @secret.map.with_index { |c, i| c unless checked[i] }

    guess.each_with_index do |pin, i|
      next unless !checked[i] && (secret_remain.include? @colors[pin])

      # puts "pin: #{pin}, at i #{i} secret remain before: #{secret_remain}"
      @code_pegs.push 'W'
      secret_remain.delete_at secret_remain.index(@colors[pin] || secret_remain.length)
      # puts "secret remain after: #{secret_remain}\n\n"
    end
  end
end
