
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum������ - �̹��� ÷��</title>

<script src="daumeditor/js/popup.js" type="text/javascript"	charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<link rel="stylesheet" href="daumeditor/css/popup.css" type="text/css" charset="utf-8" />

<script type="text/javascript">
// <![CDATA[

	


	
	function done(fileInfo) { // fileInfo�� Ajax ��û �� �����ϴ� JSON������ �����͸� ���� ��ü 
	if (typeof(execAttach) == 'undefined') { return; } 
	var _mockdata = { 'imageurl': fileInfo.imageurl, 'filename': fileInfo.filename, 'filesize': fileInfo.filesize, 'imagealign': fileInfo.imagealign, 'originalurl': fileInfo.originalurl, 'thumburl': fileInfo.thumburl }; 
	execAttach(_mockdata); // �������¿����Ϳ� ���̱�
	closeWindow(); // �̹��� �˾� ���� 
	}

	

	function initUploader(){
	    var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('�߸��� ��η� �����ϼ̽��ϴ�.');
	        return;
	    }
	    
	    var _attacher = getAttacher('image', _opener);
	    registerAction(_attacher);
	}
	
	
	function validation(fileName) { 
		
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1; // .�ں��� Ȯ����
		var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex,fileName.length); // Ȯ���� �ڸ���
		if(!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif') || (fileNameExtension === 'png') || (fileNameExtension === 'bmp'))) {
			alert('jpg, gif, png, bmp Ȯ���ڸ� ���ε� �����մϴ�.');
			return true; 
		} else { 
			return false; 
			} 
		}

	$(document).ready(function (){ // <input type=file> �±� ��� ����
		$('.file input[type=file]').change(function (){ 
		var inputObj = $(this).prev().prev(); // �ι�° �� ����(text) ��ü
		var fileLocation = $(this).val(); // ���ϰ�� ��������
		inputObj.val(fileLocation.replace('C:\\fakepath\\','')); // ��� �������� ������ ������ ��ΰ� ����Ǽ� �����Ƿ� ��ü �� text�� ��� �ֱ� 
	
		//��Ϲ�ư Ŭ�� �̺�Ʈ 
		$('.submit a').on('click', function () { 
		var form = $('#daumOpenEditorForm'); // form id��
		var fileName = $(".file-text").val(); // ���ϸ�(�����θ� �Ǵ� ���ϸ�) 
		form.ajaxSubmit({ type: 'POST', url: 'singleUploadImageAjax.do', dataType: 'JSON', // ���ϵǴ� ����Ÿ Ÿ��
		beforeSubmit: function() { if(validation(fileName)) { // Ȯ���� üũ(jpg, gif, png, bmp) 
		return false; } 
		}, success: function(fileInfo) { // fileInfo�� �̹��� ������ �����ϴ� ��ü
		if(fileInfo.result===-1) { // �����ܿ��� üũ �� �����
		alert('jpg, gif, png, bmp Ȯ���ڸ� ���ε� �����մϴ�.'); return false; } else if(fileInfo.result===-2) { // �����ܿ��� üũ �� ����� 
		alert('������ 3MB�� �ʰ��Ͽ����ϴ�.'); return false; 
		} else { 
		done(fileInfo); // ÷���� �̹����� �����Ϳ� �����Ű�� �˾�â�� ����
					} 
				} 
			});
		});


	}); 
});
// ]]>
</script>

<style> /* css */
.header {
	background-image: none;
	background-color: #027dfc;
} /* ����÷��(.file) */
.file {
	display: inline-block;
	margin-top: 8px;
	overflow: hidden;
}

.file .file-text {
	display: inline-block;
	padding: 6px 10px 8px 10px;
	border: 1px solid #c7c7c7;
	width: 179px;
	font-size: 14px;
	color: #8a8a8a;
	float: left;
}

.file .file-text:FOCUS {
	border-color: #54c4e5;
	outline: 0;
	-webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075), 0px 0px 8px
		rgba(102, 175, 233, 0.6);
	box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075), 0px 0px 8px
		rgba(102, 175, 233, 0.6);
}

.file .file-btn {
	margin-left: 2px;
	padding: 6px 8px 4px 8px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	font-weight: bold;
	background-color: #fff;
	border: 1px solid #989898;
	color: #989898;
	cursor: pointer;
	float: left;
}

.file .file-btn:HOVER {
	background-color: #edfbff;
	border: 1px solid #009bc8;
	color: #009bc8;
}
</style>


</head>
<body onload="initUploader();">
	<div class="wrapper">
		<div class="header">
			<h1>���� ÷��</h1>
		</div>
		<div class="body">
			<dl class=alert>
				<dt>&nbsp;3MB���� (JPG,GIF,PNG,BMP)</dt>
				<dd>
					<form id=daumOpenEditorForm encType=multipart/form-data method=post
						action="">
						<!-- ����÷�� -->
						<div class=file>
							<input disabled class=file-text> <label class=file-btn
								for=uploadInputBox>����÷��</label> <input id=uploadInputBox
								style="display: none" type=file name=Filedata>
							<!-- ��ư��ü��(�Ⱥ���) -->
						</div>
						<!-- //����÷�� -->
					</form>
				</dd>
			</dl>


		</div>
		<div class="footer">
			<ul>
				<li class="submit"><a href="#" title="���" class="btnlink">���</a></li>
				<li class="cancel"><a href="#" onclick="closeWindow();"
					title="���" class="btnlink">���</a></li>
			</ul>
		</div>
	</div>
</body>
</html>