# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_create do
    self.id = ULID.generate
  end
end
