module ApplicationHelper

  def flash_messages
    output = ''
    %w{notice success error warning}.each { |type| output += flash_message(type.to_sym) }
    raw output
  end

  def flash_message(type, opts={})
    return '' unless flash[type]
    hide = opts.nil? ? true : (opts[:hide] || true)
    raw "<div class=\"notification full #{type.to_s} #{(hide ? 'flash' : '')}\"><div class=\"text\"><h2>#{flash[type]}</h2></div></div>"
  end

  # Parse JS Arguments
  #
  # @param [Symbol] the args to be parsed
  def parse_js_args(args)
    args.collect { |arg| arg.to_json.tr '"', '\'' }.join(', ')
  end

end
