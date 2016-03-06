class Event < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  has_many :results
  has_and_belongs_to_many :teams
  belongs_to :winner, class_name: 'Team'

  accepts_nested_attributes_for :bids
  accepts_nested_attributes_for :teams, allow_destroy: true

  scope :upcoming, -> { all }
  scope :today, -> { where(time: (DateTime.now.beginning_of_day..DateTime.now.end_of_day)) }

  after_update :process_results, if: :winner_id_changed?

  def process_results
    ResultsWorker.perform_async(self.id)
  end
end
