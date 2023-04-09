/*datetime-local 오늘 이전 날짜는 불가하도록 지정 */

		var dateElement = document.getElementById('svc_datetime');
		var now = new Date();
		var date = new Date(now.getTime() - now.getTimezoneOffset() * 60000)
				.toISOString().slice(0, -8);
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
