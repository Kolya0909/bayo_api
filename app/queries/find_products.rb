class FindProducts

  FILTER_BY = %w(filter_by_product_type filter_by_product_status).freeze

  def initialize(relation, params)
    @relation = relation
    @params = params
    @search = params[:search]
    @filter_by_product_type = params[:filter_by_product_type]
    @filter_by_product_status = params[:filter_by_product_status]
  end

  SORTING = {
    default: -> (relation) { relation.order(created_at: :desc) },
    created_asc: -> (relation) { relation.order(created_at: :asc) },
    name_asc: -> (relation) { relation.order(name: :asc) },
    name_desc: -> (relation) { relation.order(name: :desc) },
    price_asc: -> (relation) { relation.order(price: :asc) },
    price_desc: -> (relation) { relation.order(price: :desc) },
    rating_asc: -> (relation) { relation.order(rating: :asc) },
    rating_desc: -> (relation) { relation.order(rating: :desc) }

  }.freeze

  def call
    scope = make_search
    scope = SORTING[sort_by].call(scope)
    filter_product(scope)
  end

  private

  attr_reader :relation, :params, :sort_by, :search, :filter_by_product_status, :filter_by_product_type

  def make_search
    search.nil? ? relation : relation.where("name LIKE ?", "%#{search}%")
  end

  def sort_by
    @sort_by = sorting_params_invalid? ? :default : params[:sort_by].to_sym
  end

  def sorting_params_invalid?
    SORTING.keys.exclude?(params[:sort_by].try(:to_sym))
  end

  def filter_product(scope)
    scope = scope.send(filter_by_product_type.to_sym) if filter_product_type_params_valid?
    scope = scope.send(filter_by_product_status.to_sym) if filter_product_status_params_valid?
    scope
  end

  def filter_product_type_params_valid?
    relation.product_types.keys.include?(filter_by_product_type)
  end

  def filter_product_status_params_valid?
    relation.product_statuses.keys.include?(filter_by_product_status)
  end
end
