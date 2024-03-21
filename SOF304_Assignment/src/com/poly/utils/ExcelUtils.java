package com.poly.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

public class ExcelUtils {

	public static final String CHROME_DRIVER_SRC = System.getProperty("user.dir") + "/test-resources/chromedriver.exe";
	public static final String DATA_SRC = System.getProperty("user.dir") + "/test-resources/data/";
	public static final String IMAGES_SRC = System.getProperty("user.dir") + "/test-resources/images/";

	public static XSSFWorkbook getWorkbook(String filePath) throws IOException {
		File src = new File(filePath);

		if (!src.exists()) {
			throw new IOException("Không tồn tại file với đường dẫn: " + filePath);
		}

		FileInputStream fis = new FileInputStream(src);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		fis.close();

		return workbook;
	}

	public static XSSFSheet getSheet(XSSFWorkbook workbook, String sheetName) {
		XSSFSheet sheet = workbook.getSheet(sheetName);

		if (sheet == null) {
			throw new NullPointerException("Sheet " + sheetName + " không tồn tại");
		}

		return sheet;
	}

	public static CellStyle getRowStyle(XSSFWorkbook workbook) {
		CellStyle rowStyle = workbook.createCellStyle();
		rowStyle.setAlignment(HorizontalAlignment.CENTER);
		rowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		rowStyle.setWrapText(true);

		return rowStyle;
	}

	public static String getCellValue(XSSFSheet sheet, int row, int column) {
		String returnValue;
		XSSFCell cell = sheet.getRow(row).getCell(column);

		try {
			if (cell.getCellType() == CellType.STRING) {
				returnValue = cell.getStringCellValue();
			} else if (cell.getCellType() == CellType.NUMERIC) {
				returnValue = String.format("%.0f", cell.getNumericCellValue());
			} else {
				returnValue = "";
			}
		} catch (Exception e) {
			returnValue = "";
		}

		return returnValue;
	}

	public static void takeScreenShot(WebDriver driver, String outputSrc) throws IOException {
		File screenShot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
		FileUtils.copyFile(screenShot, new File(outputSrc));
	}

	public static Object[][] readSheetData(XSSFSheet sheet) {
		int rows = sheet.getPhysicalNumberOfRows();
		int columns = sheet.getRow(0).getLastCellNum();

		Object[][] data = new Object[rows - 1][columns];

		for (int row = 1; row < rows; row++) {
			for (int col = 0; col < columns; col++) {
				data[row - 1][col] = ExcelUtils.getCellValue(sheet, row, col);
			}
		}

		return data;
	}

	public static void writeImage(String imgSrc, Row row, Cell cell, XSSFSheet sheet) throws IOException {
		InputStream is = new FileInputStream(imgSrc);
		byte[] bytes = IOUtils.toByteArray(is);
		int pictureId = sheet.getWorkbook().addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_PNG);
		is.close();

		XSSFDrawing drawing = sheet.createDrawingPatriarch();
		ClientAnchor anchor = new XSSFClientAnchor();

		anchor.setCol1(cell.getColumnIndex());
		anchor.setRow1(row.getRowNum());
		anchor.setCol2(cell.getColumnIndex() + 1);
		anchor.setRow2(row.getRowNum() + 1);

		drawing.createPicture(anchor, pictureId);
	}

	public static void export(String outputSrc, XSSFWorkbook workbook) throws IOException {
		FileOutputStream out = new FileOutputStream(outputSrc);
		workbook.write(out);
		out.close();
	}

}
