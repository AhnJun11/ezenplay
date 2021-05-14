<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
</head>
<body>
	<div id="editor">This is some sample content.</div>
<script>
ClassicEditor
        .create( document.querySelector( '#editor' ),{
        	ckfinder : {
        		uploadUrl : '/upload/image'
        	}
        } )
        .then( editor => {
                console.log( editor );
        } )
        .catch( error => {
                console.error( error );
        } );
</script>
</body>
</html>