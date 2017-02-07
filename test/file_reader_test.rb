require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'

class FileReaderTest < Minitest::Test
  def setup
    @fr = FileReader.new(sample_file_for_testing)
    @fr_read = @fr.read
  end

  def sample_file_for_testing
    File.open("./data/sample.txt" , "r")
  end

  # def test_does_file_object_exist
  #   file = FileReader.new
  #   assert_instance_of file
  # end

  def test_can_it_read_text
    assert_equal @fr_read, "Here is some sample text"
  end



end
