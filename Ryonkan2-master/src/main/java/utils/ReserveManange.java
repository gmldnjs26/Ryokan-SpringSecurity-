package utils;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.gwak.dto.ReserveVO;

public class ReserveManange {
	public static List<String> reservedDays(List<ReserveVO>r_list){
		try {
			List<String>d_list = new ArrayList<String>();
			for(ReserveVO r : r_list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date startDate = new Date(r.getCheck_in().getTime());
				Date endDate = new Date(r.getCheck_out().getTime());
				Date curDate = startDate;
				while(curDate.compareTo(endDate) <= 0) {
					d_list.add(sdf.format(curDate));
					Calendar c = Calendar.getInstance();
					c.setTime(curDate);
					c.add(Calendar.DAY_OF_MONTH,1);
					curDate = c.getTime();
				}
			}
			return d_list;
		}
		catch(Exception e) {
			System.out.println("Error");
			return null;
		}
	}
}
