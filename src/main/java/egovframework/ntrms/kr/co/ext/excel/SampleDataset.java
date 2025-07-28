package egovframework.ntrms.kr.co.ext.excel;

 
import java.util.ArrayList;

//xplatform
//import com.tobesoft.xplatform.data.DataSet;
//import com.tobesoft.xplatform.data.DataTypes;

import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;

/*
 * XPLATFORM 화면에서 엑셀 EXPORT시에
 * 출력할 DATA를 서버에서 검색 후 처리할 때 사용하는 경우에
 * 샘플로 사용하기 위한 용도.
 */
public class SampleDataset {

	long rowCount = 0;
	public SampleDataset(String SvcID, ArrayList argList) {
		System.out.println("SampleDataset >>> SvcID="+SvcID);
		int argCount = argList.size();
		for(int i = 0; i < argCount; i++) {
			System.out.println("SampleDataset >>> i="+i +", value=" + argList.get(i));
		}
		
		this.rowCount = (Long) argList.get(1);
	}
	
	public DataSet getDataset() {
		DataSet dataset = new DataSet("sample");
		
		dataset.addColumn("period", DataTypes.INT, 5);
        dataset.addColumn("region", DataTypes.STRING, 255);
        dataset.addColumn("gender", DataTypes.STRING, 255);
        dataset.addColumn("rate", DataTypes.FLOAT, 5);
        dataset.addColumn("cellphone", DataTypes.FLOAT, 5);		
        dataset.addColumn("desktop", DataTypes.FLOAT, 5);		
        dataset.addColumn("notebook", DataTypes.FLOAT, 5);
        dataset.addColumn("pda", DataTypes.FLOAT, 5);
        
//        dataset.addColumn("Column0", DataTypes.STRING, 255);
//        dataset.addColumn("Column1", DataTypes.STRING, 255);
//        dataset.addColumn("Column2", DataTypes.STRING, 255);
//        dataset.addColumn("Column3", DataTypes.STRING, 255);
//        dataset.addColumn("Column4", DataTypes.STRING, 255);
//        dataset.addColumn("Column5", DataTypes.STRING, 255);
//        dataset.addColumn("Column6", DataTypes.STRING, 255);
//        dataset.addColumn("Column7", DataTypes.STRING, 255);
//        dataset.addColumn("Column8", DataTypes.STRING, 255);
//        dataset.addColumn("Column9", DataTypes.STRING, 255);
//        dataset.addColumn("Column10", DataTypes.STRING, 255);
//        dataset.addColumn("Column11", DataTypes.STRING, 255);        
		
        int nRow; 
        int j = 1;
        String val = "";
        
        for(int i = 0; i < rowCount; i++) {
            nRow = dataset.newRow();
            val = Integer.toString(i);
            dataset.set(nRow, "period", 2995 + i);            
            dataset.set(nRow, "region","서울시");
            
            if(i%2==1){
            	dataset.set(nRow, "gender", "여자");
            } else {
            	dataset.set(nRow, "gender", "남자");
            }
            
           	//dataset.set(nRow, "gender", "남자");
            	
            dataset.set(nRow, "rate", 10.2 + i);
            dataset.set(nRow, "cellphone", 5.3 + i);
            dataset.set(nRow, "desktop", 7.4 + i);
            dataset.set(nRow, "notebook", 1.5 + i);
            dataset.set(nRow, "pda", 2.6 + i);
            
//            dataset.set(nRow, "Column0",  "Column0 Test Input Data");
//            dataset.set(nRow, "Column1",  "Column1 Test Input Data");
//            dataset.set(nRow, "Column2",  "Column2 Test Input Data");
//            dataset.set(nRow, "Column3",  "Column3 Test Input Data");
//            dataset.set(nRow, "Column4",  "Column4 Test Input Data");
//            dataset.set(nRow, "Column5",  "Column5 Test Input Data");
//            dataset.set(nRow, "Column6",  "Column6 Test Input Data");
//            dataset.set(nRow, "Column7",  "Column7 Test Input Data");
//            dataset.set(nRow, "Column8",  "Column8 Test Input Data");
//            dataset.set(nRow, "Column9",  "Column9 Test Input Data");
//            dataset.set(nRow, "Column10", "Column10 Test Input Data");
//            dataset.set(nRow, "Column11", "Column11 Test Input Data");
            
            j++;
        }	
        
        return dataset;
	}

}
