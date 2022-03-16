<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

  <link rel="stylesheet" href="../allPages/styling/layout.css" />
  <link rel="stylesheet" href="../allPages/admin/thisura/admin_myaccount_styles.css" />
  <script src="layoutjs.js"></script>
  <title>SHELFS - Online Bookstore</title>
</head>

<body id="body">
  <div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
      <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-left.jsp"%>

    </div>

    <div class="navbar__right">
      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-right.jsp"%>
    </div>

    <main>
     <div class="main__container">
      <div class="formContainer">
        <h1>CHANGE ACCOUNT DETAILS</h1>
        <p>Fill the fields where you wish to change the details</p>
        <form>
          
            <div class="column">
              <label for="book-title">Change Email address</label>
              <input
                type="email"
                id="email-id"
                placeholder="Enter your email address"
              />
              <label for="password">Change Password</label>
              <input
                type="password"
                id="password"
                placeholder="Enter your new password"
              />
              <label for="phonenumber">Change Phone number</label>
              <input
                type="number"
                id="phone"
                placeholder="Enter your phone number"
              />
              <label for="houseno">Change House number</label>
              <input
                type="number"
                id="houseno"
                placeholder="Enter your House number"
              />
              <label for="street">Street</label>
              <input
                id="street"
                placeholder="Enter your street"
                
              ></input>
              <label for="street">City</label>
              <input
                id="city"
                placeholder="Enter your city"
                
              ></input>
              <label for="street">District</label>
              <input
                id="District"
                placeholder="Enter your district"
                
              ></input>
              <label for="province">Province</label>
              <input
                id="province"
                placeholder="Enter your province"
              ></input>
            </div>
        </form>
        <button>Submit</button>
      </div>
     </div>
        
    </main>

    <nav id="sidebar">
      <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
    </nav>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="script.js"></script>
  <script src="layoutjs.js"></script>
</body>

</html>