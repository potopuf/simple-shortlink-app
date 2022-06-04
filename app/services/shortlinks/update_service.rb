# frozen_string_literal: true

module Shortlinks
  class UpdateService
    def call(id, params)
      shortlink = Shortlink.find(id)
      if shortlink.update(params)
        shortlink
      else
        raise ::ShortlinkValidationError.new(shortlink, :edit,'Shortlink validation error during update.')
      end
    end
  end
end
