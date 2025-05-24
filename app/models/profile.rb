class Profile < ApplicationRecord
    has_one :user, dependent: :destroy
    has_rich_text :bio 
    validates :bio, presence: true
end
