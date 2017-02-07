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

	def test_can_it_return_top_third_of_all_characters # this doens't work
		# skip
		# binding.pry
		assert_equal "0.0.0.0.0.", @nw.top_line
	end

	def test_can_it_return_second_third # this also doesn't work
		assert_equal "00.00.0..0", @nw.mid_line
	end

	def test_can_it_return_third_third # this also doesn't work
		assert_equal "....0.0.0.", @nw.bottom_line
	end


end
