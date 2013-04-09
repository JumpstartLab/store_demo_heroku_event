module Search
  def self.filter_products(params = {})
    if params[:category_id].present?
      Category.find(params[:category_id]).products.where(status: 'active')
    elsif params[:search].present?
      Product.where("title ILIKE ? OR description ILIKE ?",
                    "%#{params[:search]}%",
                    "%#{params[:search]}%").where(status: 'active')
    else
      Product.find_all_by_status('active')
    end
  end

  def self.filter_user_orders(user_id, params={})
    orders = Order.where(user_id: user_id).all
    if params[:search].present?
      products = Product.where("title ILIKE ? OR description ILIKE ?",
                               "%#{params[:search]}%",
                               "%#{params[:search]}%")
      orders.select { |order| (order.products & products).present? }
    else
      orders
    end
  end

  def self.filter_admin_orders(params={})
    orders = Order.includes(:user)
                  .by_status(params[:status])
                  .by_email(params[:email])
    orders = filter_date(orders, params)
    filter_price_and_execute_sql(orders, params)
  end

  def self.filter_date(order, params)
    if params[:date_symbol].present? && params[:date].present?
      date = params[:date].split('-').map{ |char| char.to_i }
      if params[:date_symbol] == '<' || params[:date_symbol] == '>'
        order.where("orders.created_at #{params[:date_symbol]}= ?",
                            params[:date])
      elsif params[:date_symbol] == '='
        order.where("orders.created_at >= ? and orders.created_at <= ?",
          DateTime.new(date[0], date[1], date[2]),
          DateTime.new(date[0]+1, date[1], date[2]))
      end
    else
      order
    end
  end

  def self.filter_price_and_execute_sql(orders, params)
    orders = orders.order('orders.created_at DESC').all
    if params[:price_symbol].present? && params[:price].present?
      orders = orders.select do |order|
        order.total > (BigDecimal.new(params[:price].to_s) / 100)
      end
    end
    orders
  end
end
