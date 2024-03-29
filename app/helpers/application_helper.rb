module ApplicationHelper

  def flash_messages
    output = ''
    flash.each { |name, msg| output += flash_message(name.to_sym, msg) }
    raw output
  end

  def flash_message(name, msg, opts={})
    return '' unless flash[name]
    hide = opts.nil? ? true : (opts[:hide] || true)
    raw "<div class=\"notification full #{name.to_s} #{(hide ? 'flash' : '')}\"><div class=\"text\"><h2>#{flash[name]}</h2></div></div>"
  end

  # Parse JS Arguments
  #
  # @param [Symbol] the args to be parsed
  def parse_js_args(args)
    args.collect { |arg| arg.to_json.tr '"', '\'' }.join(', ')
  end

  def summarize(body, length)
    return simple_format = body[0..length]+'...'
  end

  def admin?
    controller.class.name.split("::").first=="Admin"
  end

end
