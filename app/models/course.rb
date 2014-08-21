class Course < ActiveRecord::Base
  validates :type, inclusion: { in: %w(web mobile), message: "#{value} is not a registered type, please edit your model" }
  validates :city, inclusion: { in: %w(barcelona madrid miami), message: "#{value} is not a registered city, please edit your model" }
  validates :start_date_before_end_date

  private
  def start_date_before_end_date
    if start_date.to_i > end_date.to_i
      errors.add(:start_date, 'The initial date has to be before the end date')
    end
  end
end
