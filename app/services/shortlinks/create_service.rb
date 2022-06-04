# frozen_string_literal: true

module Shortlinks
  class CreateService
    def call(params)
      shortlink = Shortlink.new(params)
      if shortlink.save
        shortlink
      else
        raise ::ShortlinkValidationError.new(shortlink, :new,'Shortlink validation error during creation.')
      end
    end
  end
end
