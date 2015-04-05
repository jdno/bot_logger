require "bot_logger/version"

module BotLogger
  # The following constants define the available severity levels
  DEBUG = 0
  INFO = 1
  WARN = 2
  ERROR = 3
  OFF = 4

  # Sets the output stream the logger uses. For tests, pass StringIO.new. If you do not initialize the output
  # stream, $stderr is used.
  def self.output=(output)
    @output = output
  end

  # Sets the log level. Available options are BotLogger::{DEBUG, INFO, WARN, ERROR, OFF}.
  def self.log_level=(log_level)
    @log_level = log_level
  end

  # Returns true if the log level is currently set to DEBUG. Use this before calling `Logger.debug(log)` to prevent
  # the unnecessary (and costly) creation of strings.
  def self.debug?
    DEBUG == log_level
  end

  # Prints a debug log. If the log level is not set to debug, no action is taken.
  def self.debug(log)
    output.puts log if log_level <= DEBUG
  end

  # Prints an info log. If the log level is not set to info or lower, no action is taken.
  def self.info(log)
    output.puts log if log_level <= INFO
  end

  # Prints a warn log. If the log level is not set to warn or lower, no action is taken.
  def self.warn(log)
    output.puts log if log_level <= WARN
  end

  # Prints an error log. If the log level is not set to error, no action is taken.
  def self.error(log)
    output.puts log if log_level <= ERROR
  end

  private

  # Returns the log level. If the log level has not been set, the default log level is returned (currently WARN).
  def self.log_level
    @log_level ||= WARN
  end

  # Returns the output stream. If the logger has not been initializes with an output stream, $stderr is returned.
  def self.output
    @output ||= $stderr
  end
end
