require 'colorize'
COLORIZE = { 'R' => ' R '.colorize(color: :white, background: :red),
             'B' => ' B '.colorize(color: :white, background: :blue),
             'Y' => ' Y '.colorize(color: :light_blue, background: :yellow),
             'G' => ' G '.colorize(color: :light_blue, background: :green),
             'V' => ' V '.colorize(color: :white, background: :magenta),
             'P' => ' P '.colorize(color: :light_blue, background: :light_magenta),
             'W' => ' W '.colorize(color: :black, background: :white),
             'C' => ' C '.colorize(color: :black, background: :yellow) }

# this module makes printing prettier with colors on terminal
module PrettyPrint
  def print_colored(arr)
    # input sample: ["pink", "pink", "green", "yellow"]
    (arr.each { |symbol| print COLORIZE[symbol[0].upcase] })
  end
end
