class Property < ApplicationRecord
    CLEANING_FEE = 5_000.freeze
    CLEANING_FEE_MONEY = Money.new(CLEANING_FEE)
    SERVICE_FEE_PERCENTAGE = 0.08.freeze
    validates :name, presence: true
    validates :headline, presence: true
    validates :description, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :address_1, presence: true
    monetize :price_cents, allow_nil: true
    has_many_attached :images, dependent: :destroy

    has_many :reviews, as: :reviewable
    has_many :favorites, dependent: :destroy
    has_many :favorited_users, through: :favorites, source: :user

    has_many :reservations, dependent: :destroy
    has_many :reserved_users, through: :reservations, source: :user
    has_many :payments, through: :reservations
    geocoded_by :address
    after_validation :geocode, if: -> { latitude.blank? && longitude.blank? }
    def address
        # [address_1, address_2, city, state, country].compact.join(', ')
        [state, country].compact.join(', ')
    end
    def default_image
        images.first
    end

    def favorited_by?(user)
        return if user.nil?
        favorited_users.include?(user)
    end 

end
