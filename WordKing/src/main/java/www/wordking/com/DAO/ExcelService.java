package www.wordking.com.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import www.wordking.com.VO.Excel;


@Service
public class ExcelService {

	/**
	 *���ε��� ���������� ���� ����Ʈ�� �����
	 * @param excelFile
	 * @return ������ ���� ����Ʈ
	 */
	public List<Excel> uploadExcelFile(MultipartFile excelFile){
		List<Excel> list = new ArrayList<Excel>();
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

			// ù��° ��Ʈ �ҷ�����
			XSSFSheet sheet = workbook.getSheetAt(0);

			for(int i=1; i<sheet.getLastRowNum() + 1; i++) {
				Excel fruit = new Excel();
				XSSFRow row = sheet.getRow(i);

				// ���� �����ϱ� ������ �н�
				if(null == row) {
					continue;
				}

				// ���� �ι�° ��(�̸����� �޾ƿ���) 
				XSSFCell cell = row.getCell(1);
				if(null != cell) fruit.setName(cell.getStringCellValue());
				// ���� ����° �� �޾ƿ���
				cell = row.getCell(2);
				if(null != cell) fruit.setPrice((long)cell.getNumericCellValue());
				// ���� �׹�° �� �޾ƿ���
				cell = row.getCell(3);
				if(null != cell) fruit.setQuantity((int)cell.getNumericCellValue());
				
				
				list.add(fruit);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	/**
	 * �������Ϸ� ���� ����Ʈ ����
	 * @param names
	 * @param prices
	 * @param quantities
	 * @return �������� ����Ʈ
	 */
	public ArrayList<Excel> makeFruitList(String[] names, long[] prices, int[] quantities){
		ArrayList<Excel> list = new ArrayList<Excel>();
		for(int i=0; i< names.length; i++) {
			Excel fruit = new Excel(names[i], prices[i], quantities[i]);
			list.add(fruit);
		}
		return list;
	}

	/**
	 * ���� ����Ʈ�� ������ ���� ��ũ�� ��ü�� ����
	 * @param list
	 * @return ������ ��ũ��
	 */
	public SXSSFWorkbook makeSimpleFruitExcelWorkbook(List<Excel> list) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// ��Ʈ ����
		SXSSFSheet sheet = workbook.createSheet("����ǥ");

		//��Ʈ �� �ʺ� ����
		sheet.setColumnWidth(0, 1500);
		sheet.setColumnWidth(0, 3000);
		sheet.setColumnWidth(0, 3000);
		sheet.setColumnWidth(0, 1500);

		// ��� �� ��
		Row headerRow = sheet.createRow(0);
		// �ش� ���� ù��° �� �� ����
		Cell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("��ȣ");
		// �ش� ���� �ι�° �� �� ����
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("�����̸�");
		// �ش� ���� ����° �� �� ����
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("����");
		// �ش� ���� �׹�° �� �� ����
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("����");

		// ����ǥ ���� �� �� �� ����
		Row bodyRow = null;
		Cell bodyCell = null;
		for(int i=0; i<list.size(); i++) {
			Excel fruit = list.get(i);

			// �� ����
			bodyRow = sheet.createRow(i+1);
			// ������ ��ȣ ǥ��
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(i + 1);
			// ������ �̸� ǥ��
			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(fruit.getName());
			// ������ ���� ǥ��
			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(fruit.getPrice());
			// ������ ���� ǥ��
			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(fruit.getQuantity());
		}

		return workbook;
	}

	/**
	 * ������ ���� ��ũ���� ��Ʈ�ѷ����� �ް����� �޼�
	 * @param list
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess(List<Excel> list) {
		return this.makeSimpleFruitExcelWorkbook(list);
	}

}
