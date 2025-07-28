package egovframework.ntrms.kr.co.ext.excel;

import java.io.BufferedReader;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.Reader;

/**
 * <p>구분자로 분리하여 줄 단위의 읽기를 수행한다.
 *
 * @author Choi, Jongkwan
 */
class SeperatorRS extends BufferedReader {

	/* 읽은 문자들을 저장하는 버퍼 */
	private CharArrayWriter buffer;
	/* 구분자 */
	private char seperator;

	/**
	 * 소스 <code>Reader</code>와 구분자를 가지는 생성자이다.
	 *
	 * @param in 소스 Reader
	 * @param seperator 구분자
	 */
	public SeperatorRS(Reader in, char seperator) {
		super(in);

		this.seperator = seperator;
	}

	/**
	 * 소스 <code>Reader</code>, 버퍼 크기와 구분자를 가지는 생성자이다.
	 *
	 * @param in 소스 Reader
	 * @param size 버퍼 크기
	 * @param seperator 구분자
	 */
	public SeperatorRS(Reader in, int size, char seperator) {
		super(in, size);

		this.seperator = seperator;
	}

	/**
	 * 구분자로 분리하여 한 줄을 읽는다.
	 *
	 * @return 구분자로 분리된 한 줄
	 */
	public String readLine() throws IOException {
		// TODO 성능 개선
		if (buffer == null) {
			buffer = new CharArrayWriter();
		} else {
			buffer.reset();
		}
		boolean isEnd = false;

		while (true) {
			int ch = read();

			if (ch == -1) {
				isEnd = true;
				break;
			} else if (ch == seperator) {
				isEnd = false;
				break;
			} else {
				buffer.write(ch);
			}
		}

		String str = buffer.toString();

		if (str.length() == 0) {
			return isEnd ? null : str;
		} else {
			return str;
		}
	}
}
