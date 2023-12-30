# Human maker: can create secret manually
class HumanMaker < CodeMaker
  include UserIO

  def initialize(colors)
    super
    @secret = create_secret
  end

  private

  def create_secret
    loop do
      print 'You are the code maker. Create your secret now (E.g. rrbb): '
      input = gets.chomp.gsub(' ', '').split('')
      if code_input_valid?(input, @colors)
        # puts "secret is: #{@secret}"
        return input.map { |symbol| @colors[symbol.upcase] }
      end

      print '[Invalid Format] Format: `RRRR` or `r r r r`. Case and space insensitive. '
    end
  end
end
