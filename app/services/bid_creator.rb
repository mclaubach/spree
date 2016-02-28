class BidCreator
  def initialize(user_id, event_id, choice_id)
    @user_id = user_id
    @event_id = event_id
    @choice_id = choice_id
  end

  def create!
    bid = Bid.where(event_id: @event_id, user_id: @user_id).first_or_create
    bid.update(update_params)
    bid.save
  end

  private

  def update_params
    {choice_id: @choice_id}
  end
end
