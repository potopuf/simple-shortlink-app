# frozen_string_literal: true

class Shortlink < ApplicationRecord
  validates_presence_of :title,
                        :destination,
                        :back_half

  validates_uniqueness_of :back_half,
                          conditions: -> { where(deleted: false) }

  validates :title, allow_blank: false, length: { maximum: 30 }
  validates :destination, allow_blank: false, length: { maximum: 100 }, uri: true
  validates :back_half,
            allow_blank: false,
            length: { maximum: 20 },
            format: { with: /\A[a-z0-9_]+\Z/, message: 'Can contain only lowercase letters, numbers and _' }
end
