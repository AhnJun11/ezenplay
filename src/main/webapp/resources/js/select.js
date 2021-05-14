window.onload = function(){
							var xhr = new XMLHttpRequest();
							xhr.open('GET', '/user');
							xhr.onreadystatechange = function(){
								if(xhr.readyState==4 && xhr.status==200){
									console.log(xhr.responseText);
									var res = JSON.parse(xhr.responseText);
									var h = '';
									for(var user of res){
										
										h += '<tr>'; 
										h += '<td>' + user.userId + '</td>'; 
										h += '<td>'+ user.userPwd + '</td>';  
										h += '</tr>';
										
									}
									document.querySelector('#tBody').innerHTML = h;
								}
							}
							xhr.send();
						}