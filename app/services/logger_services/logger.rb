module LoggerServices
  module Logger
    COLORS = {
      black: 30,
      blue:  34,
      yellow: 33,
      cyan: 36,
      green: 32,
      magenta: 35,
      red: 31,
      white: 37
    }

    def exception(exception_object, options = {})
      Airbrake.notify(exception_object, options)
      prefix = exception_object.class
      exception_message = "#{prefix}\t"
      exception_message << options.each_entry.map { |(key, value)| "#{key}:#{value}" }.join("\t")
      Rails.logger.info "\e[#{COLORS[:red]}m#{exception_message}\033[0m"
    end

    def info(message, code = nil)
      color = COLORS.fetch(code.to_s.to_sym, 32)
      Rails.logger.info "\e[#{color}m#{cover_message(message)}\033[0m"
    end

    def fatal(e, raise_airbrake = false, options = {})
      Rails.logger.fatal "\e[#{COLORS[:red]}m#{e.message}\033[0m"
      Rails.logger.fatal "\e[#{COLORS[:red]}m#{e.backtrace}\033[0m"
      Airbrake.notify(options) if raise_airbrake
    end

    def cover_message(message)
      if message.is_a?(String)
        message
      elsif message.is_a?(Hash)
        message.to_json
      else
        message.inspect
      end
    end
    module_function :info, :cover_message, :fatal, :exception
  end
end
