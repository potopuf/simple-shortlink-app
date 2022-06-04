# frozen_string_literal: true

module ShortlinkErrorsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ShortlinkValidationError do |exception|
      Rails.logger.error exception.message

      @shortlink = exception.shortlink
      render exception.view_name, status: :unprocessable_entity
    end
  end
end
