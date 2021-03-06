Gem::Specification.new do |s|
  s.name = 'titlecase'
  s.version = '0.1.3'
  s.date = '2020-12-08'
  s.summary = 'String methods to properly title case a headline.'
  s.email = 'samsouder@gmail.com'
  s.homepage = 'http://github.com/samsouder/titlecase'
  s.description = 'titlecase is a set of methods on the Ruby String class to add title casing support as seen on Daring Fireball <http://daringfireball.net/2008/05/title_case>.'
  s.authors = ['Samuel Souder']
  s.files = [
    'README',
    'titlecase.gemspec',
    'lib/titlecase.rb',
    'lib/words/smallwords.rb',
    'lib/words/german/function_words.rb',
    'lib/words/german/transition_words.rb',
    'spec/examples_en.yaml',
    'spec/examples_de.yaml',
    'spec/titlecase_spec.rb'
  ]
  s.has_rdoc = false
end
