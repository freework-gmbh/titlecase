require File.join(File.dirname(__FILE__), '../lib/titlecase.rb')
require 'yaml'

describe String do
  context 'english locale' do
    File.open(File.join(File.dirname(__FILE__), 'examples_en.yaml')) do |file|
      examples = YAML.safe_load(file)
      examples['should_pass'].each do |e|
        it "should be the expected value (#{e['expect']})" do
          expect(e['example'].titlecase).to eq(e['expect'])
        end
      end
    end
  end

  context 'german locale' do
    File.open(File.join(File.dirname(__FILE__), 'examples_de.yaml')) do |file|
      examples = YAML.safe_load(file)
      examples['should_pass'].each do |e|
        it "should be the expected value (#{e['expect']})" do
          expect(e['example'].titlecase(:de)).to eq(e['expect'])
        end
      end
    end
  end

  context 'self modifying' do
    it 'should self-modify the original value in place' do
      string = 'a complex thing'
      string.titlecase!
      expect(string).to eq('A Complex Thing')
    end

    it 'works with locale' do
      string = 'eine komplexe dinge'
      string.titlecase!(:de)
      expect(string).to eq('Eine Komplexe Dinge')
    end
  end
end
