# These interview questions are addicting; I have to stop with them and get on something else. But one more won’t hurt:

# Write a function that takes a string and determines if the delimiters in the string are balanced. The pairs of delimiters are (), [], {}, and <>, and delimiters may be nested. In addition, determine that string delimiters ‘ and ” are properly matched; other delimiters lose their magical delimiter-ness property within quoted strings. Any delimiter is escaped if it follows a backslash.

# Your task is to write the function to determine if a string has balanced delimiters. When you are finished, you are welcome to read or run a suggested solution, or to post your own solution or discuss the exercise in the comments below.

require 'rspec'

class Deliminator
  class Invalid < StandardError; end

  def initialize(string)
    @string = string
    @position = 0
  end

  def balanced?
    parse
    build
  rescue
    false
  end

  def parse
    @tokens = []
    @string.each_char do |chr|
      if @skip
        @skip = false
      else
        @tokens << case chr
        when '[' then :open_square
        when ']' then :close_square
        when '{' then :open_swig
        when '}' then :close_swig
        when '(' then :open_round
        when ')' then :close_round
        when '<' then :open_angle
        when '>' then :close_angle
        when '"' then :double_quotes
        when "'" then :single_quotes
        when '\\' then
          @skip = true
          nil
        end
      end
    end
    @tokens.compact!
  end

  def build
    tree = Tree.new
    @tokens.each do |token|
      tree = tree.add(token)
    end
    tree.valid?
  end

  class Tree
    def initialize(parent=nil)
      @parent = parent
    end

    def close(token)
      token == @closer
    end

    def valid?
      @parent.nil?
    end

    def map
      {
        :open_square => :close_square,
        :open_swig => :close_swig,
        :open_round => :close_round,
        :open_angle => :close_angle
      }
    end

    def add(token)
      case token
      when *map.keys
        @closer = map[token]
        Tree.new(self)
      when *map.values
        raise Invalid unless @parent && @parent.close(token)
        @parent
      when :double_quotes, :single_quotes
        @closer = token
        TreeQuotes.new(self)
      else
        raise "Unknown Symbol: #{token}"
      end
    end
  end

  class TreeQuotes < Tree
    def add(token)
      if @parent.close(token)
        @parent
      else
        self
      end
    end
  end
end

describe Deliminator do
  it 'returns true for an empty string' do
    Deliminator.new('').should be_balanced
  end

  it 'returns false when a single unbalanced element' do
    Deliminator.new('[').should_not be_balanced
  end

  it 'returns false when a single unbalanced close element' do
    Deliminator.new(')').should_not be_balanced
  end

  it 'returns true when a balances set' do
    Deliminator.new('[]').should be_balanced
  end

  it 'returns false when a uneven set' do
    Deliminator.new('[[]').should_not be_balanced
  end

  it 'returns true when unbalanced within quotes' do
    Deliminator.new('"["').should be_balanced
  end

  it 'ignores escaped charcters' do
    Deliminator.new('[\]]').should be_balanced
  end

  it 'swiggle sets' do
    Deliminator.new('{').should_not be_balanced
    Deliminator.new('{}').should be_balanced
  end

  it 'round sets' do
    Deliminator.new('(').should_not be_balanced
    Deliminator.new(')').should_not be_balanced
    Deliminator.new('()').should be_balanced
  end

  it 'angle sets' do
    Deliminator.new('<').should_not be_balanced
    Deliminator.new('>').should_not be_balanced
    Deliminator.new('<>').should be_balanced
  end

  it 'with single quote' do
    Deliminator.new("'['").should be_balanced
  end
end
