require "loofah"

class McBean
  VERSION = "0.1.2"
  REQUIRED_LOOFAH_VERSION = "0.4.7"

  attr_accessor :html

  def McBean.fragment(string_or_io)
    mcbean = allocate
    mcbean.html = Loofah.fragment(string_or_io)
    mcbean
  end

  def McBean.document(string_or_io)
    mcbean = allocate
    mcbean.html = Loofah.document(string_or_io)
    mcbean
  end
end
Mcbean = McBean

require "mcbean/markdown"

if Loofah::VERSION < McBean::REQUIRED_LOOFAH_VERSION
  raise RuntimeError, "McBean requires Loofah #{McBean::REQUIRED_LOOFAH_VERSION} or later (currently #{Loofah::VERSION})"
end

