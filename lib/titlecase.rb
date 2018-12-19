require_relative 'words/smallwords'

class String
  include Words::SmallWords

  def titlecase(locale = :en)
    small_words = smallwords(locale)

    x = split(' ').map do |word|
      # note: word could contain non-word characters!
      # downcase all small_words, capitalize the rest
      small_words.include?(word.gsub(/\W/, '').downcase) ? word.downcase! : word.smart_capitalize!
      word
    end
    # capitalize first and last words
    x.first.to_s.smart_capitalize!
    x.last.to_s.smart_capitalize!
    # small words after colons are capitalized
    x.join(' ').gsub(/:\s?(\W*#{small_words.join("|")}\W*)\s/) { ": #{Regexp.last_match(1).smart_capitalize} " }
  end

  def titlecase!(locale = :en)
    replace(titlecase(locale))
  end

  def smart_capitalize
    # ignore any leading crazy characters and capitalize the first real character
    if self =~ /^['"\(\[']*([a-z])/
      i = index(Regexp.last_match(1))
      x = self[i, length]
      # word with capitals and periods mid-word are left alone
      self[i, 1] = self[i, 1].upcase unless x =~ /[A-Z]/ || x =~ /\.\w+/
    end
    self
  end

  def smart_capitalize!
    replace(smart_capitalize)
  end
end
