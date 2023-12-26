package omadiki_ergasia;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class GreekWord {
    
    public String removeGreekTones(String word){
        if (word == null) {
            return null;
        }

        String normalized = Normalizer.normalize(word, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(normalized).replaceAll("");
    }

    public String acceptGreekInput(String word) throws Exception{
        if (word == null) {
            return null;
        }

        //Greek characters input
        return word = new String(word.getBytes("ISO-8859-1"), "UTF-8");
    }    
}
