# Handle user input / output
module UserIO
  def get_side
    print "Press '1' if you want to be the guesser of the secret code, '2' if the creator: "
    options = %w[1 2]
    user_pick = nil

    until options.include? user_pick
      print "Value must be either '1' or '2': " unless user_pick.nil?
      user_pick = gets.chomp
    end

    user_pick
  end

  def code_input_valid?(input, colors)
    # check if user input is valid
    # valid cases: `r r R R `, ` rrrR`, `ygg b `
    input.length == 4 && input.all? { |char| colors.keys.include? char.upcase }
  end
end
