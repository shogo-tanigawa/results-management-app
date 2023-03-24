class Game < ApplicationRecord
  mount_uploader :scorebook, ScorebookUploader
end
