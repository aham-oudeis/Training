/* *****************************************************************************
 *  Name:              Ada Lovelace
 *  Coursera User ID:  123456
 *  Last modified:     October 16, 1842
 **************************************************************************** */

import edu.princeton.cs.algs4.StdIn;
import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.StdRandom;

public class RandomWord {
    public static void main(String[] args) {
        String champion = "";
        String currentWord;
        double prob;
        int count = 1;

        while (!StdIn.isEmpty()) {
            currentWord = StdIn.readString();
            prob = 1.0 / count;

            if (StdRandom.bernoulli(prob)) {
                champion = currentWord;
            }

            count++;
        }

        StdOut.println(champion);
    }
}
