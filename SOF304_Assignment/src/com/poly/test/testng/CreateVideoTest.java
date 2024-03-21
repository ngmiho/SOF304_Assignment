package com.poly.test.testng;

import static org.testng.Assert.assertEquals;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.testng.ITestResult;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.poly.test.logs.CreateVideoData;
import com.poly.utils.ExcelUtils;

public class CreateVideoTest {
	
	private WebDriver driver;

	private final String SRC = ExcelUtils.DATA_SRC + "VIDEO_TEST.xlsx";
	
	private Set<CreateVideoData> logs;
	
	private CreateVideoData data;
	
	@BeforeClass
	public void init() {
		System.setProperty("webdriver.chrome.driver", ExcelUtils.CHROME_DRIVER_SRC);

		logs = new LinkedHashSet<>();
	}
	
	private void login(String username, String password) {
		WebElement usernameInput = driver
				.findElement(By.xpath("/html/body/div[2]/div/div/div/div[1]/div/div/div[2]/form/div[1]/input"));
		usernameInput.sendKeys(username);

		WebElement passwordInput = driver
				.findElement(By.xpath("/html/body/div[2]/div/div/div/div[1]/div/div/div[2]/form/div[2]/input"));
		passwordInput.sendKeys(password);

		WebElement loginBtn = driver
				.findElement(By.xpath("/html/body/div[2]/div/div/div/div[1]/div/div/div[2]/form/div[4]/button[1]"));
		Actions actions = new Actions(driver).click(loginBtn);
		actions.build().perform();
	}
	
	@BeforeMethod
	public void setUp() {
		driver = new ChromeDriver();
		driver.get("http://localhost:8080/SOF3011_ASM/login");
		driver.manage().window().maximize();

		data = new CreateVideoData();
		
		login("hungpbps26890", "123456");
		
		WebElement videoNavLink = driver.findElement(By.xpath("/html/body/header/div/div/div/nav/ul/li[3]/a"));
		videoNavLink.click();
	}
	
	@DataProvider(name = "createVideoData")
	public Object[][] data() throws IOException {
		XSSFWorkbook workbook = ExcelUtils.getWorkbook(SRC);

		XSSFSheet sheet = workbook.getSheet("CREATE_VIDEO_DATA");

		Object[][] data = ExcelUtils.readSheetData(sheet);

		return data;
	}
	
	private void createVideo(String title, String href, String description) throws InterruptedException {
		WebElement titleInput = driver
				.findElement(By.xpath("/html/body/div[2]/div/div/div/div[1]/div/div/div/div[2]/div/div/form/div[1]/input"));
		titleInput.sendKeys(title);
		
		WebElement hrefInput = driver
				.findElement(By.xpath("//*[@id=\"href\"]"));
		hrefInput.sendKeys(href);
		
		WebElement descriptionInput = driver
				.findElement(By.xpath("/html/body/div[2]/div/div/div/div[1]/div/div/div/div[2]/div/div/form/div[4]/textarea"));
		descriptionInput.sendKeys(description);
		
		Thread.sleep(2000);
		
		WebElement createBtn = driver
				.findElement(By.xpath("/html/body/div[2]/div/div/div/div[1]/div/div/div/div[2]/div/div/form/div[6]/div[1]/button"));
		Actions actions = new Actions(driver).click(createBtn);
		actions.build().perform();
	}
	
	@Test(dataProvider = "createVideoData")
	public void createVideoTest(String title, String href, String description, String expected) throws InterruptedException {
		createVideo(title, href, description);
		
		WebElement messageInput = driver.findElement(By.id("message"));
		String actual = messageInput.getAttribute("value");
		
		data.setTitle(title);
		data.setHref(href);
		data.setDescription(description);
		data.setAction("Test Create Video Function");
		data.setLogTime(new Date());
		data.setExpected(expected);
		data.setActual(actual);
		
		assertEquals(actual, expected);
	}
	
	@AfterMethod
	public void tearDown(ITestResult result) throws IOException {
		data.setTestMethod(result.getName());

		switch (result.getStatus()) {
		case ITestResult.SUCCESS:
			data.setStatus("PASS");
			break;
		case ITestResult.FAILURE:
			data.setStatus("FAIL");
			data.setException(result.getThrowable().getMessage());

			String path = ExcelUtils.IMAGES_SRC + "failure-" + System.currentTimeMillis() + ".png";

			ExcelUtils.takeScreenShot(driver, path);

			data.setImage(path);
			break;
		case ITestResult.SKIP:
			data.setStatus("SKIP");
		default:
			break;
		}

		logs.add(data);
		driver.close();
	}
	
	@AfterClass
	public void destroy() throws IOException {
		data.writeLog(SRC, "CREATE_VIDEO_RESULT", logs);
	}
	
}
