=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

**Problem**
-input: a textfile
-output: the longest sentence from the text file
-definitiono  of a sentence: any string of words that ends with either '.', '!', or '?'
-defition of the longest: maximum number of words.

clarifications needed
-what if several sentences have the same number of words
-what if the number of characters are different for the sentences with the same length?

Data Structures and Algorithm
-load the textfile and store it in a variable
  1.How? File.open('pg84.txt').read or File.read('pg84.txt')
-spliit the strings into sentences with three delimiters (. | ! | ?)
  1. split can take regex to split along those three delmiters (/\.|\?|!/)
-store the split sentences into arrays
-create another array with the length of each sentences.
  --each string sentence is to be split into array of words
  --take the size of the array of words
-find the index of the maximum value of the mapped array
-use that index to pick the desired sentence.
=end

text = File.read('pg84.txt')

array_of_sentences = text.split(/\.|\?|!/)

array_of_sentence_size = array_of_sentences.map {|sentence| sentence.split.size}

idx_of_longest_sentence = array_of_sentence_size.find_index(array_of_sentence_size.max)

longest_sentence = array_of_sentences[idx_of_longest_sentence]

# simpler solution from Launchschool

# longest_sentence = array_of_sentences.max_by {|sentence| sentence.split.size}
# shortest_sentence = array_of_sentences.min_by {|sentence| sentence.split.size}

puts array_of_sentences.size

puts '*' * 80
puts longest_sentence + "."
puts '*' * 80


# puts array_of_sentence_size[idx_of_longest_sentence]


# p text.split.take(2)