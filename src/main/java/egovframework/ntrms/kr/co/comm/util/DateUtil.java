package egovframework.ntrms.kr.co.comm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

//import com.sun.istack.internal.logging.Logger;

//import com.crystaldecisions12.reports.common.enums.MinuteType;


/**
 * @(#) DateTime.java
 *
 * NOTICE !      You can copy or redistribute this code freely,
 * but you should not remove the information about the copyright notice
 * and the author.
 *
 * @author  WonYoung Lee, javaservice@hanmail.net
 * 2007.01.08 getProcdate 메소드 추가 (getShortDateString() + getShortTimeString())
 */
public class DateUtil{ 
	
	/**
	 * Don't let anyone instantiate this class
	 */
	private DateUtil() {}
	
	private static final SimpleDateFormat korFormats[];
	private static final SimpleDateFormat engFormats[];
	private static final SimpleDateFormat korTimeFormats[];

	static {
		korFormats = new SimpleDateFormat[4];
		korFormats[0] = new SimpleDateFormat ("yyyy/mm/dd", Locale.KOREA);
		korFormats[1] = new SimpleDateFormat ("yyyy.mm.dd", Locale.KOREA);
		korFormats[2] = new SimpleDateFormat ("yyyy-mm-dd", Locale.KOREA);
		korFormats[3] = new SimpleDateFormat ("yyyymmdd", Locale.KOREA);

		engFormats = new SimpleDateFormat[4];
		engFormats[0] = new SimpleDateFormat ("mm/dd/yyyy", Locale.ENGLISH);
		engFormats[1] = new SimpleDateFormat ("mm.dd.yyyy", Locale.ENGLISH);
		engFormats[2] = new SimpleDateFormat ("mm-dd-yyyy", Locale.ENGLISH);
		engFormats[3] = new SimpleDateFormat ("mmddyyyy", Locale.ENGLISH);

		korTimeFormats = new SimpleDateFormat[4];
		korTimeFormats[0] = new SimpleDateFormat ("HH:mm:ss", Locale.KOREA);
		korTimeFormats[1] = new SimpleDateFormat ("HH.mm.ss", Locale.KOREA);
		korTimeFormats[2] = new SimpleDateFormat ("HH-mm-ss", Locale.KOREA);
		korTimeFormats[3] = new SimpleDateFormat ("HHmmss", Locale.KOREA);
	}

	// 2007-01-08 getProcdate 메소드 추가
	public static String getProcdate() {
		return DateUtil.getShortDateString() + DateUtil.getShortTimeString();
	}

	public static String dateToKorFormat(String dateString, char separator){
		Date date = null;
		if (dateString == null)
			return "          ";
		if (dateString.equals("00000000")) {
			StringBuffer StrBuff = null;
			StrBuff = new StringBuffer();
			StrBuff.append("0000");
			StrBuff.append(separator);
			StrBuff.append("00");
			StrBuff.append(separator);
			StrBuff.append("00");
			return StrBuff.toString();
		}

		if(dateString.length() == 8) {
			for(int i = 0; i < korFormats.length; i++) {
				try {
					date = korFormats[i].parse(dateString);
					break;
				}catch(Exception e){}
			}

			if(date == null) return dateString;

			SimpleDateFormat format = new SimpleDateFormat ("yyyy" + separator + "mm" + separator + "dd", Locale.KOREA);
			return format.format(date);
		} else if(dateString.length() == 4) {
			return dateString.substring(0,2) + separator + dateString.substring(2,4);
		} else {
			return "";
		}

	}

	public static String dateToEngFormat(String dateString, char separator){
		Date date = null;

		if (dateString == null)
			return "          ";
		if (dateString.equals("00000000")) {
			StringBuffer StrBuff = null;
			StrBuff = new StringBuffer();
			StrBuff.append("0000");
			StrBuff.append(separator);
			StrBuff.append("00");
			StrBuff.append(separator);
			StrBuff.append("00");
			return StrBuff.toString();
		}

		for(int i = 0; i < korFormats.length; i++)
		{
			try {
				date = korFormats[i].parse(dateString);
				break;
			}catch(Exception e){}
		}

		if(date == null) return dateString;

		SimpleDateFormat format = new SimpleDateFormat ("mm" + separator + "dd" + separator + "yyyy", Locale.KOREA);
		return format.format(date);
	}

	public static String TimeToKorFormat(String dateString, char separator){
		Date date = null;

		for(int i = 0; i < korTimeFormats.length; i++)
		{
			try {
				date = korTimeFormats[i].parse(dateString);
				break;
			}catch(Exception e){}
		}

		if(date == null) return dateString;

		SimpleDateFormat format = new SimpleDateFormat ("HH" + separator + "mm" + separator + "ss", Locale.KOREA);
		return format.format(date);
	}

	/**
	 * check date string validation with the default format "yyyyMMdd".
	 * @param s date string you want to check with default format "yyyyMMdd".
     * @return date java.util.Date
	 */
	public static java.util.Date check(String s) throws java.text.ParseException {
		return check(s, "yyyyMMdd");
	}

	/**
	 * check date string validation with an user defined format.
	 * @param s date string you want to check.
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
     * @return date java.util.Date
	 */
	public static java.util.Date check(String s, String format) {

		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = null;
		try {
			date = formatter.parse(s);
		}
		catch(java.text.ParseException e) {
            /*
			throw new java.text.ParseException(
				e.getMessage() + " with format \"" + format + "\"",
				e.getErrorOffset()
			);
            */
		}

        return date;
	}

	/**
	 * check date string validation with the default format "yyyyMMdd".
	 * @param s date string you want to check with default format "yyyyMMdd"
	 * @return boolean true 날짜 형식이 맞고, 존재하는 날짜일 때
	 *                 false 날짜 형식이 맞지 않거나, 존재하지 않는 날짜일 때
	 */
	public static boolean isValid(String s) throws Exception {
		return DateUtil.isValid(s, "yyyyMMdd");
	}

	/**
	 * check date string validation with an user defined format.
	 * @param s date string you want to check.
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return boolean true 날짜 형식이 맞고, 존재하는 날짜일 때
	 *                 false 날짜 형식이 맞지 않거나, 존재하지 않는 날짜일 때
	 */
	public static boolean isValid(String s, String format) {
/*
		if ( s == null )
			throw new NullPointerException("date string to check is null");
		if ( format == null )
			throw new NullPointerException("format string to check date is null");
*/
		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = null;
		try {
			date = formatter.parse(s);
		}
		catch(java.text.ParseException e) {
            return false;
		}

		if ( ! formatter.format(date).equals(s) )
            return false;

        return true;
	}

	/**
	 * @return formatted string representation of current day with  "yyyy-MM-dd".
	 */
	public static String getDateString() {
		try {
			java.text.SimpleDateFormat formatter =
	            new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.KOREA);
			return formatter.format(new java.util.Date());
		}
		catch(Exception e) {
            return "";
		}
	}

	/**
	 *
	 * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 *
	 * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
	 * @return formatted string representation of current day and time with  your pattern.
	 */
	public static int getDay() {
		return getNumberByPattern("dd");
	}

 	/**
	 *
	 * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 *
	 * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
	 * @return formatted string representation of current day and time with  your pattern.
	 */
	public static int getYear() {
		return getNumberByPattern("yyyy");
	}

	/**
	 *
	 * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 *
	 * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
	 * @return formatted string representation of current day and time with  your pattern.
	 */
	public static int getMonth() {
		return getNumberByPattern("MM");
	}

	/**
	 *
	 * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 *
	 * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
	 * @return formatted string representation of current day and time with  your pattern.
	 */
	public static int getNumberByPattern(String pattern) {
		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat (pattern, java.util.Locale.KOREA);
		String dateString = formatter.format(new java.util.Date());
		return Integer.parseInt(dateString);
	}

	/**
	 *
	 * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 *
	 * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
	 * @return formatted string representation of current day and time with  your pattern.
	 */
	public static String getFormatString(String pattern) {
		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat (pattern, java.util.Locale.KOREA);
		String dateString = formatter.format(new java.util.Date());
		return dateString;
	}

	/**
	 * @return formatted string representation of current day with  "yyyyMMdd".
	 */
	public static String getShortDateString() {
		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
		return formatter.format(new java.util.Date());
	}

	/**
	 * @return formatted string representation of current time with  "HHmmss".
	 */
	public static String getShortTimeString() {
		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat ("HHmmss", java.util.Locale.KOREA);
		return formatter.format(new java.util.Date());
	}

	/**
	 * @return formatted string representation of current time with  "yyyy-MM-dd-HH:mm:ss".
	 */
	public static String getTimeStampString() {
		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat ("yyyy-MM-dd-HH:mm:ss:SSS", java.util.Locale.KOREA);
		return formatter.format(new java.util.Date());
	}

	/**
	 * @return formatted string representation of current time with  "HH:mm:ss".
	 */
	public static String getTimeString() {
		java.text.SimpleDateFormat formatter =
            new java.text.SimpleDateFormat ("HH:mm:ss", java.util.Locale.KOREA);
		return formatter.format(new java.util.Date());
	}


	/**
	 * return days between two date strings with default defined format.(yyyyMMdd)
	 * @param s date string you want to check.
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 요일을 리턴
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 *          0: 일요일 (java.util.Calendar.SUNDAY 와 비교)
	 *          1: 월요일 (java.util.Calendar.MONDAY 와 비교)
	 *          2: 화요일 (java.util.Calendar.TUESDAY 와 비교)
	 *          3: 수요일 (java.util.Calendar.WENDESDAY 와 비교)
	 *          4: 목요일 (java.util.Calendar.THURSDAY 와 비교)
	 *          5: 금요일 (java.util.Calendar.FRIDAY 와 비교)
	 *          6: 토요일 (java.util.Calendar.SATURDAY 와 비교)
	 * 예) String s = "20000529";
	 *  int dayOfWeek = whichDay(s, format);
	 *  if (dayOfWeek == java.util.Calendar.MONDAY)
	 *      System.out.println(" 월요일: " + dayOfWeek);
	 *  if (dayOfWeek == java.util.Calendar.TUESDAY)
	 *      System.out.println(" 화요일: " + dayOfWeek);
	 */
    public static int whichDay(String s) throws java.text.ParseException {
        return whichDay(s, "yyyyMMdd");
    }

	/**
	 * return days between two date strings with user defined format.
	 * @param s date string you want to check.
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 요일을 리턴
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 *          0: 일요일 (java.util.Calendar.SUNDAY 와 비교)
	 *          1: 월요일 (java.util.Calendar.MONDAY 와 비교)
	 *          2: 화요일 (java.util.Calendar.TUESDAY 와 비교)
	 *          3: 수요일 (java.util.Calendar.WENDESDAY 와 비교)
	 *          4: 목요일 (java.util.Calendar.THURSDAY 와 비교)
	 *          5: 금요일 (java.util.Calendar.FRIDAY 와 비교)
	 *          6: 토요일 (java.util.Calendar.SATURDAY 와 비교)
	 * 예) String s = "2000-05-29";
	 *  int dayOfWeek = whichDay(s, "yyyy-MM-dd");
	 *  if (dayOfWeek == java.util.Calendar.MONDAY)
	 *      System.out.println(" 월요일: " + dayOfWeek);
	 *  if (dayOfWeek == java.util.Calendar.TUESDAY)
	 *      System.out.println(" 화요일: " + dayOfWeek);
	 */

    public static int whichDay(String s, String format) throws java.text.ParseException {
 		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = check(s, format);

        java.util.Calendar calendar = formatter.getCalendar();
		calendar.setTime(date);
        return calendar.get(java.util.Calendar.DAY_OF_WEEK);
    }

	/**
	 * return days between two date strings with default defined format.("yyyyMMdd")
	 * @param String from date string
	 * @param String to date string
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 2개 일자 사이의 나이 리턴
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static int daysBetween(String from, String to) throws java.text.ParseException {
        return daysBetween(from, to, "yyyyMMdd");
    }

	/**
	 * return days between two date strings with user defined format.
	 * @param String from date string
	 * @param String to date string
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 2개 일자 사이의 일자 리턴
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static int daysBetween(String from, String to, String format) throws java.text.ParseException {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
        java.util.Date d1 = check(from, format);
        java.util.Date d2 = check(to, format);

        long duration = d2.getTime() - d1.getTime();

        return (int)( duration/(1000 * 60 * 60 * 24) );
        // seconds in 1 day
    }

	/**
	 * return age between two date strings with default defined format.("yyyyMMdd")
	 * @param String from date string
	 * @param String to date string
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 2개 일자 사이의 나이 리턴
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static int ageBetween(String from, String to) throws java.text.ParseException {
        return ageBetween(from, to, "yyyyMMdd");
    }

	/**
	 * return age between two date strings with user defined format.
	 * @param String from date string
	 * @param String to date string
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 2개 일자 사이의 나이 리턴
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static int ageBetween(String from, String to, String format) throws java.text.ParseException {
        return (int)(daysBetween(from, to, format) / 365 );
    }

	/**
	 * return add day to date strings
	 * @param String date string
	 * @param int 더할 일수
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 일수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static String addDays(String s, int day) throws java.text.ParseException {
        return addDays(s, day, "yyyyMMdd");
    }

	/**
	 * return add day to date strings with user defined format.
	 * @param String date string
	 * @param int 더할 일수
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 일수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static String addDays(String s, int day, String format) throws java.text.ParseException{
 		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = check(s, format);

        date.setTime(date.getTime() + ((long)day * 1000 * 60 * 60 * 24));
        return formatter.format(date);
    }

	/**
	 * return add month to date strings
	 * @param String date string
	 * @param int 더할 월수
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 월수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static String addMonths(String s, int month) {
    	try{
    		return addMonths(s, month, "yyyyMMdd");
    	}catch(Exception e){
    		e.printStackTrace();
    		return "";
    	}
    }

	/**
	 * return add month to date strings with user defined format.
	 * @param String date string
	 * @param int 더할 월수
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 월수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static String addMonths(String s, int addMonth, String format) {
 		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = check(s, format);
 		java.text.SimpleDateFormat yearFormat =
		    new java.text.SimpleDateFormat("yyyy", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat monthFormat =
		    new java.text.SimpleDateFormat("MM", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat dayFormat =
		    new java.text.SimpleDateFormat("dd", java.util.Locale.KOREA);
        int year = Integer.parseInt(yearFormat.format(date));
        int month = Integer.parseInt(monthFormat.format(date));
        int day = Integer.parseInt(dayFormat.format(date));

        month += addMonth;
        if (addMonth > 0) {
            while (month > 12) {
                month -= 12;
                year += 1;
            }
        } else {
            while (month <= 0) {
                month += 12;
                year -= 1;
            }
        }
 		java.text.DecimalFormat fourDf = new java.text.DecimalFormat("0000");
 		java.text.DecimalFormat twoDf = new java.text.DecimalFormat("00");
        String tempDate = String.valueOf(fourDf.format(year))
                         + String.valueOf(twoDf.format(month))
                         + String.valueOf(twoDf.format(day));
        java.util.Date targetDate = null;

        try {
            targetDate = check(tempDate, "yyyyMMdd");
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}

        return formatter.format(targetDate);
    }

    public static String addYears(String s, int year) throws java.text.ParseException {
        return addYears(s, year, "yyyyMMdd");
    }

    public static String addYears(String s, int year, String format){

 		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = null;

    	try{
    		date = check(s, format);
	        date.setTime(date.getTime() + ((long)year * 1000 * 60 * 60 * 24 * (365 + 1)));
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}

        return formatter.format(date);
    }

    /**
	 * return sub month to date strings
	 * @param String date string
	 * @param int 뺄 월수
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 월수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static String subMonths(String s, int month) {
    	String tempMonth = null;
    	try{
    		tempMonth =  subMonths(s, month, "yyyyMMdd");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return  tempMonth;
    }

	/**
	 * return sub month to date strings with user defined format.
	 * @param String date string
	 * @param int 뺄 월수
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 월수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
	 */
    public static String subMonths(String s, int subMonth, String format)  {
 		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = check(s, format);
 		java.text.SimpleDateFormat yearFormat =
		    new java.text.SimpleDateFormat("yyyy", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat monthFormat =
		    new java.text.SimpleDateFormat("MM", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat dayFormat =
		    new java.text.SimpleDateFormat("dd", java.util.Locale.KOREA);
        int year = Integer.parseInt(yearFormat.format(date));
        int month = Integer.parseInt(monthFormat.format(date));
        int day = Integer.parseInt(dayFormat.format(date));

        month -= subMonth;
        if (month <= 0) {
            month += 12;
            year -= 1;
        }
 		java.text.DecimalFormat fourDf = new java.text.DecimalFormat("0000");
 		java.text.DecimalFormat twoDf = new java.text.DecimalFormat("00");
        String tempDate = String.valueOf(fourDf.format(year))
                         + String.valueOf(twoDf.format(month))
                         + String.valueOf(twoDf.format(day));
        java.util.Date targetDate = null;

        try {
            targetDate = check(tempDate, "yyyyMMdd");
        } catch(Exception pe) {
        	pe.printStackTrace();
        }

        return formatter.format(targetDate);
    }


    public static int monthsBetween(String from, String to) throws java.text.ParseException {
        return monthsBetween(from, to, "yyyyMMdd");
    }

    public static int monthsBetween(String from, String to, String format) throws java.text.ParseException {
 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
        java.util.Date fromDate = check(from, format);
        java.util.Date toDate = check(to, format);

        // if two date are same, return 0.
        if (fromDate.compareTo(toDate) == 0) return 0;

 		java.text.SimpleDateFormat yearFormat =
		    new java.text.SimpleDateFormat("yyyy", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat monthFormat =
		    new java.text.SimpleDateFormat("MM", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat dayFormat =
		    new java.text.SimpleDateFormat("dd", java.util.Locale.KOREA);

        int fromYear = Integer.parseInt(yearFormat.format(fromDate));
        int toYear = Integer.parseInt(yearFormat.format(toDate));
        int fromMonth = Integer.parseInt(monthFormat.format(fromDate));
        int toMonth = Integer.parseInt(monthFormat.format(toDate));
        int fromDay = Integer.parseInt(dayFormat.format(fromDate));
        int toDay = Integer.parseInt(dayFormat.format(toDate));

        int result = 0;
        result += ((toYear - fromYear) * 12);
        result += (toMonth - fromMonth);

//        if (((toDay - fromDay) < 0) ) result += fromDate.compareTo(toDate);
        // ceil과 floor의 효과
        if (((toDay - fromDay) > 0) ) result += toDate.compareTo(fromDate);

        return result;
    }

    public static String lastDayOfMonth(String src) throws java.text.ParseException {
        return lastDayOfMonth(src, "yyyyMMdd");
    }

    public static String lastDayOfMonth(String src, String format) throws java.text.ParseException {
 		java.text.SimpleDateFormat formatter =
		    new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
		java.util.Date date = check(src, format);

 		java.text.SimpleDateFormat yearFormat =
		    new java.text.SimpleDateFormat("yyyy", java.util.Locale.KOREA);
 		java.text.SimpleDateFormat monthFormat =
		    new java.text.SimpleDateFormat("MM", java.util.Locale.KOREA);

        int year = Integer.parseInt(yearFormat.format(date));
        int month = Integer.parseInt(monthFormat.format(date));
        int day = lastDay(year, month);

        java.text.DecimalFormat fourDf = new java.text.DecimalFormat("0000");
 		java.text.DecimalFormat twoDf = new java.text.DecimalFormat("00");
        String tempDate = String.valueOf(fourDf.format(year))
                         + String.valueOf(twoDf.format(month))
                         + String.valueOf(twoDf.format(day));
        date = check(tempDate, format);

        return formatter.format(date);
    }

    private static int lastDay(int year, int month)  {
        int day = 0;
        switch(month)
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12: day = 31;
                     break;
            case 2: if ((year % 4) == 0) {
                        if ((year % 100) == 0 && (year % 400) != 0) { day = 28; }
                        else { day = 29; }
                    } else { day = 28; }
                    break;
            default: day = 30;
        }
        return day;
    }

    /**
	 * 요일에 해당하는 숫자를 해당 요일명으로 변환
	 *
	 * @param 	: int dayOfWeek(요일에 해당하는 숫자)
	 * @return 	: String dayOfWeekName(요일숫자를 해당요일명으로 리턴)
	 */
    public static String dayOfWeekName(int dayOfWeek){
    	String tmp_dwname = "";
    	if (dayOfWeek == java.util.Calendar.MONDAY)
    		tmp_dwname = "월";
    	else if (dayOfWeek == java.util.Calendar.TUESDAY)
    		tmp_dwname = "화";
    	else if (dayOfWeek == java.util.Calendar.WEDNESDAY)
    		tmp_dwname = "수";
    	else if (dayOfWeek == java.util.Calendar.THURSDAY)
    		tmp_dwname = "목";
    	else if (dayOfWeek == java.util.Calendar.FRIDAY)
    		tmp_dwname = "금";
    	else if (dayOfWeek == java.util.Calendar.SATURDAY)
    		tmp_dwname = "토";
    	else if (dayOfWeek == java.util.Calendar.SUNDAY)
    		tmp_dwname = "일";

        return tmp_dwname;
    }


    public static String getNextMonthFirstDay(){
    	return getNextMonthFirstDay("yyyyMMdd");
    }


    /**
     * 다음달 1일의 날짜를 구함
     * @return String 다음달 1일날짜
     */
    public static String getNextMonthFirstDay(String format){

    	String nextDay = null;

		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.set(DateUtil.getYear(), DateUtil.getMonth(), 1);
		SimpleDateFormat fmt = new SimpleDateFormat(format);
		nextDay = fmt.format(cal.getTime());

		return nextDay;

    }

    public static void main(String args[]) {
		String ret = DateUtil.dateToKorFormat("20061220112255",'?');

		System.out.println(ret);
    }
    
    public static String dateToString(Date date, String format, String separator){

    	String returnStr= "";
    	
    	if (format.equals("YYYYMMDD")) {
    		
    		returnStr = Integer.toString(date.getYear()) + separator + Integer.toString(date.getMonth()) + separator + Integer.toString(date.getDate());
    	} else if (format.equals("MMDDYYYY")) {
    		
    		returnStr = Integer.toString(date.getMonth()) + separator + Integer.toString(date.getDate()) + separator + Integer.toString(date.getYear());
    	}
    	
		return returnStr;
	}
    
    public static Calendar getNextAlarmCalendar(int minute){
    	
    	Calendar ca = Calendar.getInstance();
    	ca.add(Calendar.MINUTE, minute);
    	
    	return ca;
    	
    }
    
    /**
     * 입력된 날짜의 1일 조회
     * @param strDate
     * @return
     */
    public static String getFirstDate(String strDate) {
    	String sFirstDate = "";
    	if(strDate.length() == 8) {
	        String sYm = strDate.substring(0,6);
	        sFirstDate = sYm + "01";
	        return sFirstDate;
    	}
    	else {
    		return sFirstDate;
    	}
    }
    
    /**
     * 현재월의 1일 조회
     * @param strDate
     * @return
     */
    public static String getMonthFirstDate() {
    	
    	String result = "";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		result = getFirstDate(sdf.format(today));
    	
    	return result;
    }       

    
    /**
     * 헌재월의 마지막일자 조회
     * @param strDate
     * @return
     */
    public static String getMonthLastDate() {
    	
    	String result = "";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		try {
			result = lastDayOfMonth(sdf.format(today));
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    	return result;
    }   
   
    /**
     * 전월의 마지막일자 조회
     * @param strDate
     * @return
     */
    public static String getPrevLastDate() {
    	
    	String result = "";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		try {
			result = lastDayOfMonth(addMonths(sdf.format(today), -1));
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    	return result;
    }    
    
    /**
     * 전월의 1일 조회
     * @param strDate
     * @return
     */
    public static String getPrevFirstDate() {
    	
    	String result = "";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		result = getFirstDate(addMonths(sdf.format(today), -1));
    	
    	return result;
    }       
    
    /**
     * 전일 조회
     * @param today
     * @return
     */
    public static String getYesterday(Date today)
    {
        if ( today == null ) 
            throw new IllegalStateException ( "today is null" );
        SimpleDateFormat dateType = new SimpleDateFormat("yyyyMMdd");     
        Date yesterday = new Date();
        yesterday.setTime(today.getTime() - ((long) 1000 * 60 * 60 * 24));
         
        return dateType.format(yesterday);
    }   
    
    /**
     * 전월 조회
     * @param minVal
     * @return
     */
    public static String getPrevMonth(int minVal){
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
     Calendar cal = Calendar.getInstance(); 
     cal.add(cal.MONTH, -minVal);  
    
     String beforeYear = dateFormat.format(cal.getTime()).substring(0,4); 
     String beforeMonth = dateFormat.format(cal.getTime()).substring(4,6);

     String retStr = beforeYear + beforeMonth;
     return retStr;
    }   
    
    /**
     * 익월 조회
     * @param minVal
     * @return
     */
    public static String getNextMonth(int minVal){
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
     Calendar cal = Calendar.getInstance(); 
     cal.add(cal.MONTH, minVal);  
    
     String beforeYear = dateFormat.format(cal.getTime()).substring(0,4); 
     String beforeMonth = dateFormat.format(cal.getTime()).substring(4,6);

     String retStr = beforeYear + beforeMonth;
     return retStr;
    }     
}