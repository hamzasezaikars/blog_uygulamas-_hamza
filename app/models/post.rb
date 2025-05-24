class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum :status, {
    passive: 0,
    active: 1,
    must_be_update: 2
  }

  normalizes :title, with: -> title { title.squish.titlecase }

  validates :title,
            presence: { message: "Post başlığı boş bırakılamaz." },
            uniqueness: true,
            length: { maximum: 255 }

  validates :status,
            inclusion: { in: statuses.keys },
            allow_nil: true

  has_one_attached :image
  has_rich_text :article 

  has_many :category_posts, dependent: :destroy
  has_many :categories, through: :category_posts

  before_save :normalize_title
  around_save :log_save_action
  after_save :send_notification

  private

  def normalize_title
    self.title = title.strip.titleize if title.present?
  end

  def log_save_action
    Rails.logger.info("Save işlemine başlanıyor")
    yield
    Rails.logger.info("Save işlemi tamamlandı")
  end

  def send_notification
    Rails.logger.info("Post '#{title}' kaydedildi. Bildirim gönderildi.")
  end

  has_rich_text :article

  belongs_to :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :timeoutable
end
