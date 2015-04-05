require 'minitest_helper'

class TestBotLogger < Minitest::Test
  def setup
    @output = StringIO.new
    ::BotLogger.output = @output
  end

  def test_that_it_has_a_version_number
    refute_nil ::BotLogger::VERSION
  end

  def test_that_it_has_different_severity_levels
    refute_nil ::BotLogger::DEBUG
    refute_nil ::BotLogger::INFO
    refute_nil ::BotLogger::WARN
    refute_nil ::BotLogger::ERROR
    refute_nil ::BotLogger::OFF
  end

  def test_debug?
    ::BotLogger.log_level = ::BotLogger::DEBUG
    assert ::BotLogger.debug?

    ::BotLogger.log_level = ::BotLogger::INFO
    refute ::BotLogger.debug?

    ::BotLogger.log_level = ::BotLogger::WARN
    refute ::BotLogger.debug?

    ::BotLogger.log_level = ::BotLogger::ERROR
    refute ::BotLogger.debug?
  end

  def test_debug
    ::BotLogger.log_level = ::BotLogger::DEBUG

    ::BotLogger.debug('Tests are awesome')
    assert_equal('Tests are awesome', output)

    ::BotLogger.info('Tests are epic')
    assert_equal('Tests are epic', output)

    ::BotLogger.warn('Tests are marvelous')
    assert_equal('Tests are marvelous', output)

    ::BotLogger.error('Tests are lifesaver')
    assert_equal('Tests are lifesaver', output)
  end

  def test_info
    ::BotLogger.log_level = ::BotLogger::INFO

    ::BotLogger.debug('Tests are awesome')
    assert_equal(nil, output)

    ::BotLogger.info('Tests are epic')
    assert_equal('Tests are epic', output)

    ::BotLogger.warn('Tests are marvelous')
    assert_equal('Tests are marvelous', output)

    ::BotLogger.error('Tests are lifesaver')
    assert_equal('Tests are lifesaver', output)
  end

  def test_warn
    ::BotLogger.log_level = ::BotLogger::WARN

    ::BotLogger.info('Tests are epic')
    assert_equal(nil, output)

    ::BotLogger.warn('Tests are marvelous')
    assert_equal('Tests are marvelous', output)

    ::BotLogger.error('Tests are lifesaver')
    assert_equal('Tests are lifesaver', output)
  end

  def test_error
    ::BotLogger.log_level = ::BotLogger::ERROR

    ::BotLogger.warn('Tests are marvelous')
    assert_equal(nil, output)

    ::BotLogger.error('Tests are lifesaver')
    assert_equal('Tests are lifesaver', output)
  end
  
  def test_off
    ::BotLogger.log_level = ::BotLogger::OFF

    ::BotLogger.error('Tests are lifesaver')
    assert_equal(nil, output)
  end

  private

  def output
    @output.string.split("\n").last
  end
end
