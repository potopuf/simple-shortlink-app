# frozen_string_literal: true

class ShortlinkValidationError < StandardError
  attr_reader :shortlink
  attr_reader :view_name

  def initialize(shortlink, view_name, msg)
    @shortlink = shortlink
    @view_name = view_name

    super(msg)
  end
end
