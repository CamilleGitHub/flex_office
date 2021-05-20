class Office < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # include PgSearch::Model
  # pg_search_scope :search_by_city,
  #   against: [ :city ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
