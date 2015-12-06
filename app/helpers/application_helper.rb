module ApplicationHelper
  def selected?(event, bids, team)
    bid = bids.select{|bid| bid.event == event }.first
    bid && bid.choice == team
  end
end
