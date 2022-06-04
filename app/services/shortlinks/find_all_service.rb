# frozen_string_literal: true

module Shortlinks
  class FindAllService
    def call
      Shortlink.where(deleted: false)
    end
  end
end
