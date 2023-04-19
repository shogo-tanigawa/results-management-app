class Game < ApplicationRecord
  mount_uploader :scorebook, ScorebookUploader

  validates :tournament, :opponent, presence: true
end
