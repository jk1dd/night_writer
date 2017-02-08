require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'
require 'pry'

class NightReaderTest < Minitest::Test

  def setup
    @nr = NightReader.new(input_text_file)
  end

  def input_text_file
    File.open("./data/braille_sample.txt", "r").read
  end

  def input_lowercase_text_file
    File.open("./data/lowercase_braille_sample.txt", "r").read
  end

  def input_single_character_text_file
    File.open("./separate_line_char.txt", "r").read
  end

  def test_does_class_exist
    assert_instance_of NightReader, @nr
  end

  def test_does_it_contain_passed_message
    night_read_sample = NightReader.new(input_lowercase_text_file)
    assert_equal "0.0.0.0.0.\n00.00.0..0\n....0.0.0.", night_read_sample.message
  end
  # def test_can_it_find_capitals
  #   assert_equal "...0\n..00\n.00.", @nr.splitter
  # end

  def test_can_it_split_by_newline
    night_read_sample = NightReader.new(input_lowercase_text_file)
    assert_equal ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."], night_read_sample.splitter
  end

  def test_does_it_group_by_letter_correctly
    night_read_sample = NightReader.new(input_single_character_text_file)
    assert_equal "ab", night_read_sample.convert_braille_to_text
  end

  def test_can_it_convert_lowercase_braille_to_plain
    night_read_sample = NightReader.new(input_lowercase_text_file)
    assert_equal "hello", night_read_sample.convert_braille_to_text
  end

  def test_can_it_convert_long_lowercase_braille_to_plain
    night_read_sample = NightReader.new(File.open("./data/braille_sample.txt", "r").read)
    assert_equal "Test sentence bla bal bla bal bal balbalblablalb.", night_read_sample.convert_braille_to_text
  end
end
