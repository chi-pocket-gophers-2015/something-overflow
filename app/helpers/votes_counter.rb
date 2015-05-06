def tally_votes (object)
  #counts all of the votes for the given object
  all_votes = object.votes.to_a
  all_votes.reduce(0) { |sum, vote| sum + vote.value }

end
