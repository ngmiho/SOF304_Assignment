package com.poly.test.logs;

import java.io.IOException;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.poly.utils.ExcelUtils;

public class CreateVideoData extends TestData implements Log<CreateVideoData> {

	private String title;
	private String href;
	private String description;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public void writeLog(String src, String sheetName, Set<CreateVideoData> logs) throws IOException {
		XSSFWorkbook workbook = ExcelUtils.getWorkbook(src);

		XSSFSheet sheet = ExcelUtils.getSheet(workbook, sheetName);

		int startRow = 0;
		int lastRow = sheet.getPhysicalNumberOfRows();

		if (lastRow < startRow) {
			lastRow = startRow;
		}

		CellStyle rowStyle = ExcelUtils.getRowStyle(workbook);

		for (CreateVideoData log : logs) {
			Row row = sheet.createRow(lastRow);

			row.setHeightInPoints(80);
			row.setRowStyle(rowStyle);

			log.writeDataRow(log, row, sheet);

			lastRow++;
		}

		ExcelUtils.export(src, workbook);
	}

	@Override
	public void writeDataRow(CreateVideoData log, Row row, XSSFSheet sheet) throws IOException {
		CellStyle globalStyle = row.getRowStyle();

		Cell cell;

		cell = row.createCell(0);
		cell.setCellValue(log.getTitle());
		cell.setCellStyle(globalStyle);

		cell = row.createCell(1);
		cell.setCellValue(log.getHref());
		cell.setCellStyle(globalStyle);
		
		cell = row.createCell(2);
		cell.setCellValue(log.getDescription());
		cell.setCellStyle(globalStyle);

		writeTestData(3, row, sheet);
	}

}
