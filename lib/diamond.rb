# Diamond Challenge Solution
class Diamond
  END_OF_LINE = "\n".freeze
  DEFAULT_LETTER = 'A'.freeze

  def build(letter)
    diamond = []
    diamond_letters = (DEFAULT_LETTER..letter).to_a
    diamond_size = diamond_letters.length
    diamond << mount_extreme_lines(diamond_size)

    body_diamond(diamond, diamond_size, diamond_letters)
    mirroring_diamond(diamond, diamond_size, diamond_letters)

    diamond << mount_extreme_lines(diamond_size) unless letter == DEFAULT_LETTER
    diamond.join('')
  end

  private

  def side_underscore(diamond_size, position)
    '_' * (diamond_size - position - 1)
  end

  def middle_underscore(position)
    '_' * ((position * 2) - 1)
  end

  def extreme_underscore(diamond_size)
    '_' * (diamond_size - 1)
  end

  def mount_extreme_lines(diamond_size)
    extreme_underscore(diamond_size) + DEFAULT_LETTER +
      extreme_underscore(diamond_size) + END_OF_LINE
  end

  def mount_line(letter, diamond_size, position)
    side_underscore(diamond_size, position) + letter +
      middle_underscore(position) + letter +
      side_underscore(diamond_size, position) + END_OF_LINE
  end

  def body_diamond(diamond, diamond_size, diamond_letters)
    position = 1
    while position < diamond_size
      diamond << mount_line(diamond_letters[position], diamond_size, position)
      position += 1
    end
  end

  def mirroring_diamond(diamond, diamond_size, diamond_letters)
    position = diamond_size - 2
    while position > 0
      diamond << mount_line(diamond_letters[position], diamond_size, position)
      position -= 1
    end
  end
end
