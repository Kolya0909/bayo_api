class FindProducts

  def initialize(relation, params)
    @relation = relation
    @params = params
  end

  SORTING = {
    default: -> (relation) { relation.order(created_at: :desc) },
    created_asc: -> (relation) { relation.order(created_at: :asc) },
    name_asc: -> (relation) { relation.order(name: :asc) },
    name_desc: -> (relation) { relation.order(name: :desc) }
  }.freeze

  def call
    SORTING[sort_by].call(relation)
  end

  private

  attr_reader :relation, :params, :sort_by

  def sort_by
    @sort_by = sorting_params_invalid? ? :default : params[:sort_by].to_sym
  end

  def sorting_params_invalid?
    SORTING.keys.exclude?(params[:sort_by].try(:to_sym))
  end

end
