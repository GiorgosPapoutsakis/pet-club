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
}
