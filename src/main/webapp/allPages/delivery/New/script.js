//Sidebar toggle coding
var sidebarOpen = false;
var sidebar = document.getElementById("sidebar");
var sidebarCloseIcon = document.getElementById("sidebarIcon");
  
function toggleSidebar() {
  if (!sidebarOpen) {
    sidebar.classList.add("sidebar_responsive");
    sidebarOpen = true;
  }
}
  
function closeSidebar() {
  if (sidebarOpen) {
    sidebar.classList.remove("sidebar_responsive");
    sidebarOpen = false;
  }
}


//Digital clock coding
function updateTime() {
  var dateInfo = new Date();

  /* time */
  var hr, _min = (dateInfo.getMinutes() < 10) ? "0" + dateInfo.getMinutes() : dateInfo.getMinutes(), sec = (dateInfo.getSeconds() < 10) ? "0" + dateInfo.getSeconds() : dateInfo.getSeconds(), ampm = (dateInfo.getHours() >= 12) ? "PM" : "AM";

  //Replace 0 with 12 at midnight, subtract 12 from hour if 13–23
  if (dateInfo.getHours() == 0) {
    hr = 12;
  } else if (dateInfo.getHours() > 12) {
    hr = dateInfo.getHours() - 12;
  } else {
    hr = dateInfo.getHours();
  }

  var currentTime = hr + ":" + _min + ":" + sec;

  //Print time
  document.getElementsByClassName("hms")[0].innerHTML = currentTime;
  document.getElementsByClassName("ampm")[0].innerHTML = ampm;

  /* date */
  var dow = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ],
    month = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ],
    day = dateInfo.getDate();

  //Store date
  var currentDate = dow[dateInfo.getDay()] + ", " + month[dateInfo.getMonth()] + " " + day;

  document.getElementsByClassName("date")[0].innerHTML = currentDate;
};

//Print time and date once, then update them every second
updateTime();
setInterval(function() {updateTime()}, 1000);

//Notification coding
var box1  = document.getElementById('n-list');
var down1 = false;

function toggleNotifi(){
	if (down1) {
		box1.style.height  = '0px';
		box1.style.opacity = 0;
		down1 = false;
	}else {
		box1.style.height  = '390px';
		box1.style.opacity = 1;
		down1 = true;
	}
}

//Profile menu coding
var box2 = document.getElementById('p-menu');
var down2 = false;

function toggleProfileMenu() {
    if(down2) {
        box2.style.height = '0px';
        box2.style.opacity = 0;
        down2 = false;
    }
    else {
        box2.style.height  = '120px';
        box2.style.opacity = 1;
        down2 = true;
    }
}