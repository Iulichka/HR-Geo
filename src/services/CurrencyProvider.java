package services;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;


import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class CurrencyProvider {
	private static double usd, eur, rub = 1;
	private static String usdName = "აშშ დოლარი";
	private static String eurName = "ევრო";
	private static String rubName = " რუსული რუბლი";

	public static double getEurToGel() {
		return eur;
	}

	public static double getUsdToGel() {
		return usd;
	}

	public static double getGelToUsd() {
		return 1 / usd;
	}

	public static double getGelToEur() {
		return 1 / eur;
	}

	public static double getGelToRub() {
		return rub;
	}

	public static Double getRubToGel() {
		return 1 / rub;
	}

	// currency updater method
	// is called periodically
	public static void updateCurrencies() throws MalformedURLException {
		URL url = new URL("http://www.nbg.ge/rss.php");
		HttpURLConnection httpcon = null;
		try {
			httpcon = (HttpURLConnection) url.openConnection();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Reading the feed
		SyndFeedInput input = new SyndFeedInput();
		SyndFeed feed = null;
		try {
			feed = input.build(new XmlReader(httpcon));
		} catch (IllegalArgumentException | FeedException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<SyndEntry> entries = feed.getEntries();
		Iterator<SyndEntry> itEntries = entries.iterator();

		while (itEntries.hasNext()) {
			SyndEntry entry = itEntries.next();
			// System.out.println("Title: " + entry.getTitle());
			// System.out.println("Link: " + entry.getLink());
			// System.out.println("Author: " + entry.getAuthor());
			// System.out.println("Publish Date: " + entry.getPublishedDate());
			// System.out.println("Description: "
			// + entry.getDescription().getValue());
			// System.out.println();

			usd = ParseCurrency(entry.getDescription().getValue(), usdName);
			eur = ParseCurrency(entry.getDescription().getValue().toString(),
					eurName);
			rub = ParseCurrency(entry.getDescription().getValue().toString(),
					rubName);
		}
		System.out.println("usd: " + usd + " euro: " + eur + " rub: " + rub);

	}

	// parsing currency from nbg.gov.ge's rss.php file
	private static double ParseCurrency(String result, String currencyName) {
		// TODO Auto-generated method stub
		int indexOfLastTag = result.indexOf(currencyName);
		if (indexOfLastTag == -1) {
			System.out.println("can't get currency course");
			return 1;
		}
		int indexOfCourse = result.indexOf("<td>", indexOfLastTag) + 4;
		// System.out.println("result: "+result);
		return Double.parseDouble(result.substring(indexOfCourse,
				indexOfCourse + 6));

	}
}