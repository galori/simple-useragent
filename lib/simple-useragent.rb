#converted from the python script here: http://gist.github.com/88057
class SimpleUserAgent

  # Some mobile browsers which look like desktop browsers.
  MOBILE = /(iphone|ipod|blackberry|android|palm|windows\s+ce)/i
  DESKTOP = /(windows|linux|os\s+[x9]|solaris|bsd)/i
  BOT = /(spider|crawl|slurp|bot|facebookexternalhit)/i

  #Anything that looks like a phone isn't a desktop.
  #Anything that looks like a desktop probably is.
  #Anything that looks like a bot should default to desktop.
  def self.is_desktop?(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    !(user_agent =~ MOBILE) && !!(user_agent =~ DESKTOP) || !!(user_agent =~ BOT)
  end
  
  def self.is_mobile?(request_or_user_agent)
    !is_desktop?(request_or_user_agent)
  end
  
  def self.is_iphone?(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    !!(user_agent =~ /(Mobile\/.+Safari)/)
  end

  def self.is_blackberry?(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    !!(user_agent =~ /BlackBerry/)
  end
  
  def self.is_apple?(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    !!(user_agent =~ /(Mobile\/.+Safari)/) || !!(user_agent =~ /OS\s+[X9]/)
  end
  
  def self.is_ie?(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    !!(user_agent =~ /MSIE/)
  end

  # Some mobile browsers put the User-Agent in a HTTP-X header
  def self.get_user_agent(request_or_user_agent)
    return request_or_user_agent if request_or_user_agent.kind_of? String
    request_or_user_agent.env['HTTP_X_OPERAMINI_PHONE_UA'] || 
    request_or_user_agent.env['HTTP_X_SKYFIRE_PHONE'] || 
    request_or_user_agent.env['HTTP_USER_AGENT']
  end
  
  def self.browser(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    return 'firefox' if user_agent =~ /Firefox/
    return 'chrome' if user_agent =~ /Chrome/
    return 'safari' if user_agent =~ /Safari/
    return 'ie8' if user_agent =~ /MSIE 8/
    return 'ie7' if user_agent =~ /MSIE 7/
    return 'ie6' if user_agent =~ /MSIE 6/
  end
  
  def self.os(request_or_user_agent)
    user_agent = get_user_agent(request_or_user_agent)
    return 'mac' if user_agent =~ /macintosh/i
    return 'windows' if user_agent =~ /windows/i
    return 'linux' if user_agent =~ /linux|solaris|bsd/i
  end
end