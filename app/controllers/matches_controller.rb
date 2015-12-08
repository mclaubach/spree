class MatchesController < ApplicationController
	
def index
	@match.load_matches!(10)
	@matches = matches.order('started_at DESC')
end

def show
  @match = Match.find_by(id: params[:id])
end

end
