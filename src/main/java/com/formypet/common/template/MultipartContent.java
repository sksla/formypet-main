package com.formypet.common.template;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

public class MultipartContent {

	public MultipartRequest getMultipart(HttpServletRequest request) {
		
		MultipartRequest multiRequest = null;
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			try {
				multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return multiRequest;
	}
}
