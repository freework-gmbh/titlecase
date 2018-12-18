require_relative 'german/function_words'
require_relative 'german/transition_words'

module Words
  module SmallWords
    include Words::German::FunctionWords
    include Words::German::TransitionWords

    ENGLISH_SMALL_WORDS = %w[
      a an and as at but by en for if in of on or the to v v. via vs vs.
    ].freeze

    GERMAN_LOCALES = %i[
      de de-DE de-CH de-AT
    ].freeze

    ENGLISH_LOCALES = %i[
      en en-US en-GB en-DE
    ].freeze

    def smallwords(locale)
      if german_locale?(locale)
        german_smallwords
      else
        ENGLISH_SMALL_WORDS
      end
    end

    def german_locale?(locale)
      GERMAN_LOCALES.include?(locale)
    end

    def english_locale?(locale)
      ENGLISH_LOCALES.include?(locale)
    end

    def german_smallwords
      [
        german_function_words,
        german_transition_words,
        ENGLISH_SMALL_WORDS
      ].flatten
    end
  end
end
