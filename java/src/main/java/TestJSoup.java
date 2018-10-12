import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

/**
 * User: tulskiy
 * Date: 12/26/12
 */
public class TestJSoup {
    public static void main(String[] args) throws IOException {
        File file = new File(args[0]);
        int iterations = Integer.parseInt(args[1]);
        boolean enable_xpath = false;
        if(args.length == 3) {
          enable_xpath = args[2].equals("true");
        }
        Elements links = null;

        long time = System.currentTimeMillis();
        for (int i = 0; i < iterations; i++) 
        {
            Document document = Jsoup.parse(file, "UTF-8", "http://example.com/");
            if(enable_xpath) 
            {
              links = document.select("a");
            }
        }

        System.out.println(((System.currentTimeMillis() - time) / 1000f) + " s");
        if(enable_xpath) {
            System.out.println(links.size() + " links");
        }
    }
}
