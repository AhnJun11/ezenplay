	
		window.onload = function() {
			var x = new XMLHttpRequest();

			x.open('GET', '/seatlist');
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					console.log(x.responseText);

				}
			}
			x.send();
		}
	