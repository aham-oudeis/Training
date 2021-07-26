class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

p oracle.class.ancestors
# It returns (does not output) a string as "You will X", where X is the phrase selected
# randombly from the array that is returned by calling choices.