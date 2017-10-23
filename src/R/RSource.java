package R;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class RSource {
    private String sourcePath = "C:\\Users\\Jet Wang\\IdeaProjects\\CTM-alpha\\web\\Rscripts\\";
    public String readRSource(String string) throws IOException{
        sourcePath += string;
        File file = new File(sourcePath);
        BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
        String temp = null;
        StringBuffer sb = new StringBuffer();
        temp = bufferedReader.readLine();
        while (temp != null) {
            sb.append(temp + ";");
            temp = bufferedReader.readLine();
        }
        return sb.toString();
    }
}
