package com.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import dao.SelectRank;
import daoimpl.AllRankimpl;
import pojo.Student;

@WebServlet("/Excelservlet")
public class Excelservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
			throws javax.servlet.ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		OutputStream out = resp.getOutputStream();
		resp.reset();
		resp.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode("学生积分排名.xls", "utf-8"));
		resp.setHeader("Cache-Control", "no-cache");
		resp.setHeader("Pragma", "no-cache");
		resp.setDateHeader("Expires", 0);
		resp.setContentType("application/cotet-stream");
		String selval = req.getParameter("selval");
		String[] str = selval.split(",");
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("成绩表");
		sheet.setDefaultColumnWidth(12);
		// 生成一个样式  
		HSSFCellStyle style = wb.createCellStyle();
		//样式字体居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//给表头第一行一次创建单元格
		HSSFRow row1 = sheet.createRow(0);
		for (int i = 0; i < str.length; i++) {
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(str[i]);
			cell.setCellStyle(style);
		}
		//所有学生的排名
		SelectRank sr = new AllRankimpl();
		List<Student> rankstu = sr.selectRank();
		Iterator<Student> it = rankstu.iterator();
		int num=1;
		while(it.hasNext()){
			Student stu = it.next();
			HSSFRow row = sheet.createRow(num);
			
			
			HSSFCell cell0 = row.createCell(0);
			cell0.setCellValue(stu.getSno());
			HSSFCell cell1 = row.createCell(1);
			cell1.setCellValue(stu.getName());
			HSSFCell cell2 = row.createCell(2);
			cell2.setCellValue(stu.getDepartment());
			HSSFCell cell3 = row.createCell(3);
			cell3.setCellValue(stu.getScore());
			HSSFCell cell4= row.createCell(4);
			cell4.setCellValue(stu.getSturank());
			num++;
			cell0.setCellStyle(style);cell1.setCellStyle(style);cell2.setCellStyle(style);
			cell3.setCellStyle(style);cell4.setCellStyle(style);
		}
//		for (int i = 1; i < str.length; i++) {
//			HSSFRow row = sheet.createRow(i);
//			for (int j = 0; j < 8; j++) {
//				HSSFCell cell = row.createCell(j);
//				cell.setCellValue("单的中文");
//			}
//		}
	//	sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));
		wb.write(out);
	}


}
