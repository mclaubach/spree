class MatchesController < ApplicationController
	
def index
	Match.load_matches!(10)
	@matches = Match.order('started_at DESC')
end

def show
  @match = Match.find(params[:id])
end

end
