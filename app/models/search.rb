module Search
  def self.filter_products(params = {})
    if params[:category_id].present?
      Category.find(params[:category_id]).products.where(status: 'active')
    elsif params[:search].present?
      Product.where("title LIKE ? OR description LIKE ? AND status = ?",
                    "%#{params[:search]}%",
                    "%#{params[:search]}%",
                    "active")
    else
      Product.find_all_by_status('active')
    end
  end

  def self.filter_user_orders(user_id, params={})
    orders = Order.where(user_id: user_id).all
    if params[:search].present?
      products = Product.where("title LIKE ? OR description LIKE ?",
                               "%#{params[:search]}%",
                               "%#{params[:search]}%")
      orders.select { |order| (order.products & products).present? }
    else
      orders
    end
  end

# Model.where(
#     'created_at >= :five_days_ago or updated_at >= :three_days_ago',
#     :five_days_ago  => Time.now - 5.days,
#     :three_days_ago => Time.now - 3.days
# )

  def self.filter_admin_orders(params={})
    order = Order.includes(:user)
    if params[:status].present? && params[:status] != 'all'
      order = order.where(status: params[:status])
    end
    if params[:date_symbol].present? && params[:date].present?
      date = params[:date].split('-').map{ |char| char.to_i }
      if params[:date_symbol] == '<' || params[:date_symbol] == '>'
        order = order.where("orders.created_at #{params[:date_symbol]}= ?",
                            params[:date])
      elsif params[:date_symbol] == '='
        order = order.where("orders.created_at >= ? and orders.created_at <= ?",
          DateTime.new(date[0], date[1], date[2]),
          DateTime.new(date[0]+1, date[1], date[2]))
      end
    end
    if params[:email].present?
      order = order.where("email = ?", params[:email])
    end
    orders = order.all
    if params[:price_symbol].present? && params[:price].present?
      orders = orders.select { |order| order.total > (BigDecimal.new(params[:price]) / 100) }
    end
    orders
  end
end
