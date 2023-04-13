function copyUserInfo() {
				var checked = document
						.querySelector('input[type="checkbox"][value="y"]').checked;
				if (checked) {
					document.querySelector('#buyer_name').value = document.querySelector('#order_name').value;
					document.querySelector('#buyer_tel').value = document.querySelector('#order_tel').value;
					document.querySelector('#buyer_pcode').value = document.querySelector('#order_pcode').value;
					document.querySelector('#buyer_addr').value = document.querySelector('#order_addr').value;
					document.querySelector('#buyer_detail').value = document.querySelector('#order_detail').value;
				    document.getElementById('user_info').classList.remove('hidden');
				    var userInfoDiv = document.getElementById("user_info");
				    userInfoDiv.classList.add("hidden");

				}else{
					document.querySelector('#buyer_name').value = '';
			        document.querySelector('#buyer_tel').value = '';
			        document.querySelector('#buyer_pcode').value = '';
			        document.querySelector('#buyer_addr').value = '';
			        document.querySelector('#buyer_detail').value = '';
			        var userInfoDiv = document.getElementById("user_info");
			        userInfoDiv.classList.remove("hidden");

				}
			}