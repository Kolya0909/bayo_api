class RatingValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:rating, I18n.t('errors.rate_must_be_from')) if record.rate < 0 || record.rate > 5
  end
end
