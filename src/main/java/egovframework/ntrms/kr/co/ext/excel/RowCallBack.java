package egovframework.ntrms.kr.co.ext.excel;

import java.util.List;

public interface RowCallBack {
        void handleRow(List<Object> values);
}