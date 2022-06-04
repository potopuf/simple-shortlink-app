# frozen_string_literal: true

module Shortlinks
  class DeleteOneByIdService
    def call(id)
      Shortlink.find(id).update!(deleted: true)
    end
  end
end
