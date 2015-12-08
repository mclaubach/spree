class Match < ActiveRecord::Base

 def self.load_matches!(count)
 	myid = 10671926
    matches_arr = Dota.api.matches(player_id: myid, limit: count)
    if matches_arr && matches_arr.any?
      matches_arr.each do |match|
          match_info = Dota.api.matches(match.id)
          new_match = Match.create({
                                            uid: match.id,
                                            winner: match_info.winner.to_s.titleize,
                                            started_at: match_info.starts_at,
                                            mode: match_info.mode,
                                            duration: parse_duration(match_info.duration),
                                            match_type: match_info.type
                                          })
      
      end
    end
  end

private

def self.parse_duration(d)
  hr = (d / 3600).floor
  min = ((d - (hr * 3600)) / 60).floor
  sec = (d - (hr * 3600) - (min * 60)).floor

  hr = '0' + hr.to_s if hr.to_i < 10
  min = '0' + min.to_s if min.to_i < 10
  sec = '0' + sec.to_s if sec.to_i < 10

  hr.to_s + ':' + min.to_s + ':' + sec.to_s
end

end
