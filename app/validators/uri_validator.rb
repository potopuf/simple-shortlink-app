# frozen_string_literal: true

class UriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.present? && compliant?(value)
      record.errors.add(attribute, "is not a valid URI")
    end
  end

  private

  def safe?(value)
    encoded_uri = URI.encode_www_form_component(value)
    response = HTTP.get("#{Rails.configuration.ip_quality_score_service_url}/#{encoded_uri}")
    raise RemoteRequestError.new('Unable to connect to IPQualityScore service') unless response.status.success?

    parsed_response = Oj.load(response.body.to_s, symbol_keys: true)
    Rails.logger.debug("IPQualityScore response - #{parsed_response}")

    raise RemoteRequestError.new(parsed_response[:message]) unless parsed_response[:success] == true

    !parsed_response[:unsafe]
  end

  def compliant?(value)
    uri = URI.parse(value)
    uri.host.present? && safe?(value)
  rescue URI::InvalidURIError
    false
  end
end
