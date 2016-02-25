module ApplicationHelper
  def selected?(event, bids, team)
    if current_user
      bid = bids.select{|bid| bid.event == event }.first
      bid && bid.choice == team
    end
  end
end
