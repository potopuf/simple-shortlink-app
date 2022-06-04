# frozen_string_literal: true

module Shortlinks
  class FindOneByIdService
    def call(id)
      Shortlink.find(id)
    end
  end
end
