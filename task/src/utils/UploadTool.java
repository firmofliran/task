package utils;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public  class UploadTool {
	public static Map<String,String> uploadTool(HttpServletRequest req, String allExt,int filesizemax,String filelocation) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 解决上传文件名的中文乱码问题
		upload.setHeaderEncoding("utf-8");
		List<FileItem> list = new ArrayList<>();
		Map<String, String> map = new HashMap<>();
		// 提示信息
		String message = "";
		try {
			list = upload.parseRequest(req);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (!ServletFileUpload.isMultipartContent(req)) {
			map.put("error", "is not isMultipartContent");
			return map;
		}
		upload.setFileSizeMax(filesizemax);
		for (FileItem item : list) {
			// 普通表单项
			if (item.isFormField()) {
				String fieldName = item.getFieldName();
				String value="";
				try {
					value = item.getString("utf-8").trim();
					map.put(fieldName, value);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				// 上传图片
				String fieldName = item.getFieldName();
				String fileExt = item.getName();
				long size = item.getSize();
//				if(fileExt.equals("")){
//					message = "您未选择文件";
//					map.put("nochoose", message);
//					continue;
//				}
				fileExt = fileExt.substring(fileExt.lastIndexOf(".") + 1).toLowerCase();
				if (size==0) {
					message = "未选择文件";
					map.put("blanksize", message);
					continue;
				}
				if (size > upload.getFileSizeMax()) {
					message = "上传的文件超过了最大限制" + upload.getFileSizeMax()/1024 + "KB";
					map.put("bigsize", message);
					continue;
				}
				boolean flag = allExt.contains(fileExt);
				if (!flag) {
					message = "上传的图片只能是" + allExt + "格式";
					map.put("exterror", message);
					continue;
				}
				// 给保存的文件生成新的文件名
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				String newName = sdf.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				map.put(fieldName, newName);
				try {
					//  f:/allupload/publishimg"
					item.write(new File(filelocation, map.get(fieldName)));
					map.put("success", "success");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return map;
	}
}
