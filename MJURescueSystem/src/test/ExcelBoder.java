package test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelBoder {
	public static void main(String[] args) {
		//* Create Workbook and Worksheet XLSX Format */
        XSSFWorkbook my_workbook = new XSSFWorkbook();
        XSSFSheet my_sheet = my_workbook.createSheet("XLSX Cell Border");
        /* Get access to XSSFCellStyle */
        XSSFCellStyle my_style = my_workbook.createCellStyle();         
        /* XLSX File borders now */
        /* Draw a thin left border */
        my_style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        /* Add medium right border */
        my_style.setBorderRight(XSSFCellStyle.BORDER_MEDIUM);
        /* Add dashed top border */
        my_style.setBorderTop(XSSFCellStyle.BORDER_DASHED);
        /* Add dotted bottom border */
        my_style.setBorderBottom(XSSFCellStyle.BORDER_DOTTED);
        
        /* Let us create another style now */
        XSSFCellStyle my_style_2 = my_workbook.createCellStyle();
        
        /* Draw a thick left border */
        my_style_2.setBorderLeft(XSSFCellStyle.BORDER_THICK);
        /* Draw double lined right border */
        my_style_2.setBorderRight(XSSFCellStyle.BORDER_DOUBLE);
        /* Add dotted top border - hairy */
        my_style_2.setBorderTop(XSSFCellStyle.BORDER_HAIR);
        /* Add medium dashed bottom border */
        my_style_2.setBorderBottom(XSSFCellStyle.BORDER_MEDIUM_DASHED);
        
        /* One more style to illusrtate more border patterns */
        
        XSSFCellStyle my_style_3 = my_workbook.createCellStyle();
        
        /* border dash dotted*/
        my_style_3.setBorderLeft(XSSFCellStyle.BORDER_DASH_DOT);
        /* border medium dash dot */
        my_style_3.setBorderRight(XSSFCellStyle.BORDER_MEDIUM_DASH_DOT);
        /* border dash dot dot */
        my_style_3.setBorderTop(XSSFCellStyle.BORDER_DASH_DOT_DOT);
        /* border medium dash dot dot */
        my_style_3.setBorderBottom(XSSFCellStyle.BORDER_MEDIUM_DASH_DOT_DOT);
        
        XSSFCellStyle my_style_4 = my_workbook.createCellStyle();
        
        /* border dash dotted*/
        my_style_4.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        /* border medium dash dot */
        my_style_4.setBorderRight(XSSFCellStyle.BORDER_THIN);
        /* border dash dot dot */
        my_style_4.setBorderTop(XSSFCellStyle.BORDER_THIN);
        /* border medium dash dot dot */
        my_style_4.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        
        /* Attach border styles to cell */              
        Row row = my_sheet.createRow(0);                
        Cell cell = row.createCell(0);
        cell.setCellValue("Draw XLSX Cell Border Example - 1 ");                
        cell.setCellStyle(my_style);
        
        row = my_sheet.createRow(1);
        row = my_sheet.createRow(2);
        cell = row.createCell(0);
        cell.setCellValue("Draw XLSX Cell Border Example - 2 ");                
        cell.setCellStyle(my_style_2);
        
        row = my_sheet.createRow(3);
        row = my_sheet.createRow(4);
        cell = row.createCell(0);
        cell.setCellValue("Draw XLSX Cell Border Example - 3 ");                
        cell.setCellStyle(my_style_3);
        
        row = my_sheet.createRow(7);
        row = my_sheet.createRow(8);
        cell = row.createCell(0);
        cell.setCellValue("Draw XLSX Cell Border Example - 4 ");
        row.setRowStyle(my_style_4);
        /* Write changes to the workbook */
        FileOutputStream out = null;
		try {
			out = new FileOutputStream(new File("WebContent/report/cell_border_Example.xlsx"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
        try {
			my_workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
        try {
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}            
        }
}