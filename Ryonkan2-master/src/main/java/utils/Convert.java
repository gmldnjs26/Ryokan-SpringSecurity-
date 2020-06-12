package utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Convert {
	public static Timestamp StringToTimestamp(String strDate) {
		try {
			DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			Date date = formatter.parse(strDate);
			Timestamp timeStampDate = new Timestamp(date.getTime());
			return timeStampDate;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static String TimestampToString(Timestamp tsDate) {
		try {
			DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			String strDate = formatter.format(tsDate);
			return strDate;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static Timestamp StringToTimestamp2(String strDate) {
		try {
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(strDate);
			Timestamp timeStampDate = new Timestamp(date.getTime());
			return timeStampDate;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static String TimestampToString2(Timestamp tsDate) {
		try {
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = formatter.format(tsDate);
			return strDate;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}