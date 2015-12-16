class Product < ActiveRecord::Base
  mount_uploader :image_url, ProductImageUploader

  validates :title, :description, :price, presence:true
  validates :price, :numericality => { :greater_than => 0 }

  has_many :line_items
  has_many :order, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Item present')
        return false
      end
    end
end
