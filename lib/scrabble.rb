class Scrabble
  def point_values
    {
      'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
      'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
      'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
      'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
      'Q' => 10, 'R' => 1, 'S' => 1, 'T' => 1,
      'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
      'Y' => 4, 'Z' => 10
    }
  end

  def score(word, multiplier = 1)
    return 0 if word.nil? || word == ''

    score_total = 0
    word.upcase.split('').each do |x|
      # puts "#{x}:#{point_values[x]}"
      score_total += point_values[x]
    end

    score_total * multiplier
  end

  def score_with_multipliers(word, array, word_multiplier = 1)
    return 0 unless check_word_against_array(word, array)

    score_total = 0
    word_array = word.split('')

    score_total += 10 if word_array.length >= 7

    word_array.each_index do |x|
      score_total += score(word_array[x], array[x])
    end

    score_total * word_multiplier
  end

  def highest_scoring_word(words)
    highest_word = ''
    highest_score = 0
    words.each do |word|
      word_score = score(word)

      word_score += 10 if word.length >= 7

      if word_score > highest_score
        highest_word = word
        highest_score = word_score
      elsif word_score == highest_score
        if highest_word.length > word.length
          highest_word = word
          highest_score = word_score
        end
      end
    end

    highest_word
  end

  def check_word_against_array(word, array)
    word.length == array.length
  end
end
