# practice with hashes basic ideas

hash_one = {memento: 2000, dark_knight: 2012, a_separation: 2011, rashomon: 1950}
hash_two = {incendies: 2010, dogtooth: 2009, parasite: 2020}

hash_new = hash_one.merge(hash_two)

p hash_new

# how to make a frequency list with hashes?

str = "When and under what conditions are human beings responsible for their actions? Philosophers have historically responded to this question when they perceive a challenge to human responsibility. In the modern era, the challenge comes in the form of determinism, the thesis that every event, including all human actions, is determined by past events and the laws of nature. If determinism is true, how is free will possible? Likewise, philosophers since St. Augustine have asked how free will is possible if God knows all our actions. But these challenges—the theses of determinism and of an omniscient God—and the concept of the will were first articulated long after Aristotle. On similar grounds, Micheal Frede in his book A Free Will: Origins of the Notion in Ancient Thought argued that Aristotle had no concept of the will and was unaware of the problem of free will."

frequencies = {}

list_of_words = str.split(" ")

list_of_words.each { |item|
  frequencies[item.to_sym] = list_of_words.count(item)
}

p frequencies.select {|k, v| v > 3}
