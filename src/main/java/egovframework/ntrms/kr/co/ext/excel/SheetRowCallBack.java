package egovframework.ntrms.kr.co.ext.excel;

import java.util.ArrayList;
import java.util.List;

import com.nexacro.xapi.data.DataSet;

public class SheetRowCallBack implements RowCallBack {
    private DataSet ds;
	private ArrayList<String[]> rowData = new ArrayList<String[]>();
    private int row;
    private int maxColumnCount = 0;
    
	public void handleRow(List<Object> values) {
		// TODO Auto-generated method stub
		++row;
		
		if(values == null || values.size() == 0) return;
		
		
		String[] vauleArray = new String[values.size()];
		values.toArray(vauleArray);
		
		rowData.add(vauleArray);
	}
	
	public void setDataset(DataSet ds) {
		this.ds = ds;
	}
	
    public ArrayList<String> initArrayList(String[] strings) {
    	//System.out.println("\n\t\tSheetRowCallBack >> initArrayList 호출됨");
            ArrayList<String> list = new ArrayList<String>();
            for (String i : strings) {
            	//System.out.println("i=" + i);
                    list.add(i);
            }
            return list;
    }	
    
    public void setMaxColumnCount(int count) {
    	this.maxColumnCount = count;
    	
    }

    public int getMaxColumnCount() {
    	return this.maxColumnCount;
    }


    /*
     * sheet data를 dataset에 설정한다.
     */
    public void convertDataToDataset(DataSet ds) {
    	int rowCount = this.getMaxRowsInSheet();
    	
		for(int i=0; i<rowCount; i++) {
			String[] data = rowData.get(i);
			
			int colIndex = 0;
			int row = ds.newRow();
			
            for (String s : data) {
            	
            	ds.set(row, "Column" + colIndex, s);
            	colIndex++;
            	//System.out.println("s=" + s);
            }			
		}  
    }
    
    
    public int getMaxRowsInSheet() {
    	//System.out.println("\n\t\tSheetRowCallBack >> getMaxRowsInSheet 호출됨");
            return (rowData.size());
    }

    public ArrayList<String> getRow(int rownum) {
    	//System.out.println("\n\t\tgetRow >> rownum =" + rownum);
            return (initArrayList(rowData.get(rownum)));
    }
}
