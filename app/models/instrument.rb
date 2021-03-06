class Instrument < ApplicationRecord
  belongs_to :user, optional: true 
  has_many :line_items , dependent: :destroy
  has_many :comments, dependent: :destroy
  before_destroy :not_referenced_by_any_line_items
  mount_uploader :image, ImageUploader
  #serialize :image, JSON # If you use SQLite, add this line

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. "}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. "}
  validates :price, length: { maximum: 7 }
  ratyrate_rateable "Quality"

  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS  Ibanez Charvel Washburn }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }
  private
  def not_referenced_by_any_line_items
  	unless line_items.empty?
  		errors.add(:base,"Items Present")
  		throw :abort
  	end
  end
  def self.search(search)
  if search
    where('title LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
