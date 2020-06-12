<html lang="en">
<head>
<meta charset="utf-8" />
<title>jQuery UI- Default functionality</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
	$(function() {
		$("#testDatepicker").datepicker({
			showOn : "both",
			buttonImage : "button.png",
			buttonImageOnly : true
		});
	});
	$(function() {
		$("#testDatepicker2").datepicker({
			showOn : "both",
			buttonImage : "button2.png",
			buttonImageOnly : true
		});
	});
</script>
</head>
<body>
	Check in:  <input type="text" id="testDatepicker">

	Check out:  <input type="text" id="testDatepicker2">
</body>
</html>