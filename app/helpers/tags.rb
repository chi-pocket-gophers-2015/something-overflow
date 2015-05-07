# needs to check for both duplicate tags AND duplicate tagging objects associated
# with question.
def add_tags (question, tag_string)
  tag_string.split(" ").each do |tag_word|
    tag = Tag.find_or_create_by(word: tag_word)

    #check for tagging on this object.
    if !Tagging.find_by(question: question, tag: tag)
      #if question has not already been tagged by this object, then tag
      question.tags << tag
    end
  end
end
