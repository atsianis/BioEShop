<!-- Navbar -->
  <header>
    <nav class="container navbar navbar-expand-lg navbar-light" style="background-color: lightgoldenrodyellow;">
      <!-- Logo -->
      <a class="navbar-brand" href="index.html">
        <img src="${pageContext.request.contextPath}/static/img/logoo.jpg" alt="Pand-Eco logo"
          style=" position:relative; bottom: 7px; width:100px;height:60px; border-radius: 50%;">
      </a>
      <!-- Collapse button -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Menu -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

          <li class="nav-item active">
            <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Products
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="gridall.html">All products</a>
              <a class="dropdown-item" href="viewcutomers.html">Cups</a>
              <a class="dropdown-item" href="gridcup.html">Straws</a>
              <a class="dropdown-item" href="vieworders.html">Toothbrushes</a>
            </div>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Admin
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="viewcutomers.html">Customers</a>
              <a class="dropdown-item" href="gridcup.html">Pending Orders</a>
              <a class="dropdown-item" href="vieworders.html">Orders History</a>
              <a class="dropdown-item" href="vieworders.html">Messages</a>
            </div>
          </li>
        </ul>

        <!--Profile button -->
        <button type="button" class="btn">
          <span class="glyphicon glyphicon-cog"></span>
          <span class="caret"></span>
          <a href="profile.html">
            <i class="fas fa-user icon"></i>
          </a>
        </button>


        <!-- Register / Login dropdown -->
        <div class="btn-group">
          <button type="button" class="btn btn-dark dropdown-toggle dropdown-toggle-split" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            <span class="sr-only"><i class="fas fa-usercicon"></i>Toggle Dropdown</span>
          </button>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="registration.html">Resigster Now</a>
            <a class="dropdown-item" href="login.html">Login</a>
          </div>
        </div>

        <!-- Search -->
        <!--  <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
        </form> -->
      </div>
    </nav>
    <!-- Background image -->
    <div class="container-fluid color header"></div>
  </header>