class EventWinnerCalculator < Struct.new(:event)
  def perform!
    users.each do |user|
      EventWorker.perform_async(event.id, user.id)
    end
  end

  private

  def users
    User.where(id: event.bids.pluck(:user_id))
  end
end
