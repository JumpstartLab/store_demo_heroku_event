class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :status, :category_ids, :image
  has_and_belongs_to_many :categories

  has_attached_file :image, styles: { retail: "500x500",
                                      large: "500x500",
                                      thumbnail: "200x200" },
                            storage: :s3,
                            bucket: 'c3po_store_engine',
                            path: ":attachment/:id/:style.:extension",
                            s3_credentials: {
                              access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                              secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                              }

  validates :title, presence: :true,
                    uniqueness: { case_sensitive: false }
  validates :description, presence: :true
  validates :status, presence: :true,
                     inclusion: { in: %w(active retired) }
  validates :price, presence: :true,
                    format: { with: /^\d+??(?:\.\d{0,2})?$/ },
                    numericality: { greater_than: 0 }

  def toggle_status
    if status == 'active'
      update_attributes(status: 'retired')
    elsif status == 'retired'
      update_attributes(status: 'active')
    end
  end

  def on_sale?
    percent_of_original.to_i != 1
  end

  def current_price
    sale_price
  end

  def sale_price
    price - discount
  end

  def discount
    price * (1 - percent_of_original)
  end

  def percent_off
    (1 - percent_of_original) * 100
  end

  def percent_of_original
    if category_ids.present?
      percent_of_category = category_sales.map do |category_sale|
        (100 - category_sale.percent_off) / BigDecimal.new('100')
      end.inject(BigDecimal.new('1')) do |memo, percent_of_total|
        memo = memo * percent_of_total
        memo
      end
    end
    if category_ids.present?
      percent_of_product * percent_of_category
    else
      percent_of_product
    end
  end

  def product_sales
    Sale.where(group: 'product').
         where(status: 'active').
         where(foreign_key: self.id)
  end

  def percent_of_product
    sales_products = product_sales.map do |product_sale|
      (100 - product_sale.percent_off) / BigDecimal.new('100')
    end

    sales_products.inject(BigDecimal.new('1')) do |memo, percent_of_total|
      memo = memo * percent_of_total
      memo
    end
  end

  def category_sales
    Sale.where(group: 'category')
        .where(status: 'active')
        .where(foreign_key: category_ids)
  end
end
