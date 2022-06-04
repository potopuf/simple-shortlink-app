# frozen_string_literal: true

module ApplicationErrorsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      Rails.logger.error exception.message

      render file: File.join(Rails.root, 'public/404.html'), status: :not_found
    end
    rescue_from RemoteRequestError do |exception|
      Rails.logger.error exception.message

      render file: File.join(Rails.root, 'public/500.html'), status: :internal_server_error
    end
  end
end
