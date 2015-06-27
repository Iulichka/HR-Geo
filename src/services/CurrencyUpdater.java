package services;

import java.net.MalformedURLException;
import java.util.Timer;
import java.util.TimerTask;

public class CurrencyUpdater {
	private static Timer timer;
	private static TimerTask timerTask;

	public static void start(int seconds) {
		timer = new Timer();
		timerTask = new TimerTask() {

			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					CurrencyProvider.updateCurrencies();
				} catch (MalformedURLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		// TODO Auto-generated method stub
		timer.schedule(timerTask, 0, seconds * 100);
	}

	public static void shutdown() {
		timer.cancel();
		timerTask.cancel();
	}
}