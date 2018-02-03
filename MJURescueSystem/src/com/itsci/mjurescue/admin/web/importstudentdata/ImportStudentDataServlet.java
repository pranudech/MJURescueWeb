package com.itsci.mjurescue.admin.web.importstudentdata;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@WebServlet("/ImportStudentDataServlet")
public class ImportStudentDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImportStudentDataServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		HttpSession session = request.getSession();

		ImportStudentDataManager importStudent = new ImportStudentDataManager();
		Vector<LoginBean> listLogin = new Vector<LoginBean>();

		try {

			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

			for (FileItem item : multiparts) {
				String projectDir = request.getServletContext().getRealPath("/");
				String fileName = new File(item.getName()).getName();
				File myPath = new File(projectDir + "/WebContent/upload");

				if (!myPath.exists()) {
					myPath.mkdirs();
				}

				File file = new File(myPath + "/" + fileName);
				item.write(file);
				String filePath = myPath + "/" + fileName;

				FileInputStream fi = new FileInputStream(new File(filePath));
				XSSFWorkbook myWorkBook = new XSSFWorkbook(fi);
				XSSFSheet sheet = myWorkBook.getSheetAt(0);
				Iterator<Row> rowIterator = sheet.iterator();

				rowIterator.next();
				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();
					Iterator<Cell> cellIterator = row.cellIterator();

					StudentBean student = new StudentBean();
					LoginBean login = new LoginBean();
					int count = 0;

					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						cell.setCellType(Cell.CELL_TYPE_STRING);
						count += 1;

						if (cell != null) {
							if (count == 1) {
								student.setStudentID(cell.getStringCellValue());
								String password = cell.getStringCellValue().substring(0, 2) + cell.getStringCellValue().substring(7, 10);
								
//								byte[] newPassword = Base64.encode(password.getBytes());
//								String passwordEndcode = null;
//								try {
//									passwordEndcode = new String(newPassword, "UTF-8");
//								} catch (UnsupportedEncodingException e) {
//									e.printStackTrace();
//								}
								login.setPassword(password);
								
							} else if (count == 2) {
								student.setStudentName(cell.getStringCellValue());
							} else if (count == 3) {
								student.setStudentIdCode(cell.getStringCellValue());
							} else if (count == 4) {
								student.setFaculty(cell.getStringCellValue());
							} else if (count == 5) {
								student.setDepartment(cell.getStringCellValue());
							} else if (count == 6) {
								student.setYear(cell.getStringCellValue());
							} else if (count == 7) {
								student.setStatus(cell.getStringCellValue());
							}
						}
					}
					login.setStudentBean(student);
					listLogin.add(login);
				}
			}

			if (importStudent.isAddStudent(listLogin)) {
				session.setAttribute("studentMessage", "บันทึกข้อมูลในระบบเรียบร้อย");
				response.sendRedirect("adminImportStudent.jsp");
			}

		} catch (Exception e) {
			ExceptionUtil.messageException(new Throwable(), e);
			session.setAttribute("studentMessage", importStudent.getErrorMessage());
			response.sendRedirect("adminImportStudent.jsp");
		}
	}
}