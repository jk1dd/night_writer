require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class NightWriterTest < Minitest::Test

  def setup
    @nw = NightWriter.new(input_text_file)
  end

  def input_text_file
    File.open("./data/sample.txt", "r").read
  end

  def input_long_file
    File.open("./data/long_string.txt", "r").read
  end

  def test_does_class_exist
    assert_instance_of NightWriter, @nw
  end

  def test_do_we_have_input_string
    assert_equal "hello\n", @nw.message
  end
  #

  def test_did_hash_load
    assert_equal Hash, @nw.alphabet.class
  end

  def test_does_hash_have_all_characters
    assert_equal 35, @nw.alphabet.keys.length
  end

  def test_letter_a
    assert_equal ["0.","..",".."], @nw.alphabet["a"]
  end

  def test_can_it_output_three_lines
    assert_equal "hello\nhello\nhello\n", @nw.triplicate
	end

	def test_can_it_access_message
		assert_equal "hello\n", @nw.message
	end

	def test_can_it_return_top_third_of_all_characters
    new_night = NightWriter.new("hello") # this doens't work
		assert_equal "0.0.0.0.0.", new_night.top_line
	end


	def test_can_it_return_second_third # this also doesn't work
    new_night = NightWriter.new("hello")
    assert_equal "00.00.0..0", new_night.mid_line
	end

	def test_can_it_return_third_third # this also doesn't work
    new_night = NightWriter.new("hello")
    assert_equal "....0.0.0.", new_night.bottom_line
	end

  def test_can_it_combine_lines
    new_night = NightWriter.new("hello")
    assert_equal "0.0.0.0.0.\n00.00.0..0\n....0.0.0.", new_night.combine_lines

  end

  def test_can_it_combine_spaced_string
    new_night = NightWriter.new("hello world")
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", new_night.combine_lines
  end

  def test_can_it_combine_capital_letters
    new_night = NightWriter.new("Hello")
    assert_equal "..0.0.0.0.0.\n..00.00.0..0\n.0....0.0.0.", new_night.combine_lines
  end

  def test_can_it_combine_capital_spaced_string
    new_night = NightWriter.new("Hello ")
    assert_equal "..0.0.0.0.0...\n..00.00.0..0..\n.0....0.0.0...", new_night.combine_lines
  end

  def test_can_array_be_split_up
    new_night = NightWriter.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    new_night.combine_lines
    assert_equal ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0."], new_night.splitter[0]
  end

  def test_can_it_be_joined
    new_night = NightWriter.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    new_night.combine_lines
    new_night.splitter
    assert_equal "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n..\n", new_night.joiner
  end

end
