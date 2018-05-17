<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="
java.io.PrintWriter, 
java.util.UUID, 
java.io.File, 
java.io.FileOutputStream, 
java.io.OutputStream, 
java.io.InputStream, 
java.util.List, 
org.apache.commons.fileupload.disk.DiskFileItemFactory, 
org.apache.commons.fileupload.servlet.ServletFileUpload, 
org.apache.commons.fileupload.FileItem"
%>

<%
if (ServletFileUpload.isMultipartContent(request)){
    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
    //UTF-8 ���ڵ� ����
    uploadHandler.setHeaderEncoding("UTF-8");
    List<FileItem> items = uploadHandler.parseRequest(request);
    String realname = "";
    Long size = 0L;
    //�� �ʵ��±׵��� FOR���� �̿��Ͽ� �񱳸� �մϴ�.
    for (FileItem item : items) {
        //image.html ���� file �±��� name ���� "image_file"�� ������ �־����Ƿ�
        if(item.getFieldName().equals("image_file")) {
            if(item.getSize() > 0) {
                String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
                //���� �⺻���
                String defaultPath = request.getSession().getServletContext().getRealPath("/");
                //���� �⺻��� _ �󼼰��
                String path = defaultPath + "upload" + File.separator;
                 
                File file = new File(path);
                 
                //���丮 �������� ������� ���丮 ����
                if(!file.exists()) {
                    file.mkdirs();
                }
                //������ ���ε� �� ���ϸ�(�ѱ۹����� ���� ���������� �ø��� �ʴ°��� ����)
                realname = UUID.randomUUID().toString() + "." + ext;
                size = item.getSize();
                ///////////////// ������ ���Ͼ��� /////////////////
                InputStream is = item.getInputStream();
                OutputStream os=new FileOutputStream(path + realname);
                int numRead;
                byte b[] = new byte[(int)item.getSize()];
                while((numRead = is.read(b,0,b.length)) != -1){
                    os.write(b,0,numRead);
                }
                if(is != null)  is.close();
                os.flush();
                os.close();
                ///////////////// ������ ���Ͼ��� /////////////////
            }
        }
    }
    response.setContentType("text/plain; charset=UTF-8");
    PrintWriter pw = response.getWriter();
    //json string ������ callback
    //json ������ �ѱ�� �ʿ� ��
    //imageurl, filename,filesize,imagealign
    pw.print("{\"imageurl\" : \"/upload/"+realname+"\",\"filename\":\""+realname+"\",\"filesize\": 600,\"imagealign\":\"C\"}");
    pw.flush();
    pw.close();
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>